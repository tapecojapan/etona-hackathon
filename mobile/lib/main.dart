// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Uncomment the following lines when enabling Firebase Crashlytics
import 'dart:io';

import 'package:etona/gen/firebase_options_dev.dart' as dev;
import 'package:etona/gen/firebase_options_prod.dart' as prod;
import 'package:etona/router.dart';
import 'package:etona/src/audio/audio_state.gen.dart';
import 'package:etona/src/in_app_purchase/ad_removal_state.gen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:logging/logging.dart';

import 'src/ads/ads_controller.dart';
import 'src/audio/audio_controller.dart';
import 'src/crashlytics/crashlytics.dart';
import 'src/games_services/games_services.dart';
import 'src/in_app_purchase/in_app_purchase.dart';
import 'src/player_progress/persistence/local_storage_player_progress_persistence.dart';
import 'src/player_progress/player_progress.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCrashlytics? crashlytics;
  await Firebase.initializeApp(options: getFirebaseOptions());
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    try {
      await Firebase.initializeApp(options: getFirebaseOptions());
      //crashlytics = FirebaseCrashlytics.instance;
    } on Exception catch (e) {
      debugPrint("Firebase couldn't be initialized: $e");
    }
  }

  await guardWithCrashlytics(
    guardedMain,
    crashlytics: crashlytics,
  );
}

FirebaseOptions getFirebaseOptions() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'dev':
      return dev.DefaultFirebaseOptions.currentPlatform;
    case 'prod':
      return prod.DefaultFirebaseOptions.currentPlatform;
    default:
      throw ArgumentError('Not available flavor');
  }
}

/// Without logging and crash reporting, this would be `void main()`.
void guardedMain() {
  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Logger _log = Logger('main.dart');

// Prepare the google_mobile_ads plugin so that the first ad loads faster. This can be done later or with a delay if
// startup experience suffers.
final adsControllerProvider =
    (!kIsWeb && (Platform.isIOS || Platform.isAndroid))
        ? Provider<AdsController>(
            (ref) => AdsController(MobileAds.instance)..initialize())
        : null;

// Attempt to log the player in.
final gamesServicesControllerProvider =
    (!kIsWeb && (Platform.isIOS || Platform.isAndroid))
        ? Provider<GamesServicesController>(
            (ref) => GamesServicesController()..initialize())
        : null;

// Subscribing to [InAppPurchase.instance.purchaseStream] as soon as possible in order not to miss any updates and
// ask the store what the player has bought already.
final inAppPurchaseControllerProvider = (!kIsWeb &&
        (Platform.isIOS || Platform.isAndroid))
    ? StateNotifierProvider<InAppPurchaseController, AdRemovalPurchaseState>(
        (ref) => InAppPurchaseController(InAppPurchase.instance)
          ..subscribe()
          ..restorePurchases(),
      )
    : null;

/*final settingsControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>(
        SettingsController.new);*/

final audioControllerProvider =
    StateNotifierProvider<AudioController, AudioState>(AudioController.new);

final playerProgressProvider = StateNotifierProvider<PlayerProgress, int>(
  (ref) => PlayerProgress(LocalStoragePlayerProgressPersistence())
    ..getLatestFromStore(),
);

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(audioControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette().darkPen,
          background: Palette().backgroundMain,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Palette().ink,
          ),
        ),
      ),
      routeInformationParser: ref.read(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.read(routerProvider).routeInformationProvider,
      routerDelegate: ref.read(routerProvider).routerDelegate,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}

## Etona Flutter

Firebaseファイル作成
```bash
flutterfire configure --out lib/gen/firebase_options_dev.dart --android-app-id com.etona.dev --ios-bundle-id com.tapeco.etona.dev
flutterfire configure --out lib/gen/firebase_options_prod.dart --android-app-id com.etona --ios-bundle-id com.tapeco.etona
```

iOSビルド
```bash
flutter build ios --dart-define=FLAVOR=dev
```

Androidビルド
```bash
flutter build apk --dart-define=FLAVOR=dev
```

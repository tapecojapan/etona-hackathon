import 'dart:io';
import 'dart:ui';

import 'package:etona/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.photoURL,
    this.assetURL,
    this.photoFile,
    this.blur = false,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? radius;
  final String? photoURL;
  final String? assetURL;
  final XFile? photoFile;
  final Color? backgroundColor;
  final bool blur;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget _asset() {
      return Image.asset(
        assetURL!,
        fit: fit,
      );
    }

    Widget _network() {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: photoURL!,
        fit: fit,
        imageErrorBuilder: (c, o, s) {
          return Container();
        },
      );
    }

    Widget _file() {
      if (kIsWeb) {
        return Image.network(
          photoFile!.path,
          width: double.infinity,
          fit: fit,
        );
      } else {
        return Image.file(
          File(photoFile!.path),
          width: double.infinity,
          fit: fit,
        );
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 32 / 2),
      child: Container(
        height: height ?? 32,
        width: width ?? 32,
        color: backgroundColor ?? Colors.transparent,
        padding: padding,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: blur ? 10 : 0,
            sigmaY: blur ? 10 : 0,
          ),
          child: () {
            if (photoFile != null) {
              return _file();
            } else if (assetURL != null) {
              return _asset();
            } else if (photoURL == null || photoURL == '') {
              return Container(
                color: Colors.grey.withOpacity(0.02),
              );
            } else {
              return _network();
            }
          }(),
        ),
      ),
    );
  }
}

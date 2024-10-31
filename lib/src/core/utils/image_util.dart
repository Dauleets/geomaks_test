import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:geomaks_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  ImageUtil._();

  // static void show({
  //   required BuildContext context,
  //   required List<String> imagePaths,
  //   required int current,
  //   StreamController<Widget>? controller,
  // }) =>
  //     PhotoGallery(
  //       context: context,
  //       initialIndex: current,
  //       backgroundColor: Colors.white,
  //       onSwipe: (int i) => controller?.add(ImagesOverlay(length: imagePaths.length, current: i)),
  //       itemBuilder: (_, int idx) => Image.network(imagePaths[idx]),
  //       heroProperties: List<PhotoGalleryHeroProperties>.from(
  //         imagePaths.map((e) => PhotoGalleryHeroProperties(tag: e)).toList(),
  //       ),
  //       overlayController: controller,
  //       initialOverlay: ImagesOverlay(length: imagePaths.length, current: current),
  //       itemCount: imagePaths.length,
  //     ).show();

  static Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: context.theme.mainColor,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}

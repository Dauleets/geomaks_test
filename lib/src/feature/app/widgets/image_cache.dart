// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:geomaks_test/src/core/gen/assets.gen.dart';
// import 'package:geomaks_test/src/core/resources/resources.dart';

// class CustomNetworkImage extends StatelessWidget {
//   final String imageUrl;
//   final double height;
//   final double width;

//   const CustomNetworkImage({
//     super.key,
//     required this.imageUrl,
//     required this.height,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       imageUrl,
//       height: height,
//       width: width,
//       fit: BoxFit.cover,
//       loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) {
//           return child;
//         } else {
//           return Container(
//             color: AppColors.static.withOpacity(0.4),
//             width: width,
//             height: height,
//             child: const Center(
//               child: CircularProgressIndicator(
//                 strokeWidth: 5.2,
//                 color: AppColors.mainColor,
//               ),
//             ),
//           );
//         }
//       },
//       errorBuilder: (context, error, stackTrace) {
//         return Container(
//           color: AppColors.static.withOpacity(0.4),
//           width: width,
//           height: height,
//           child: Center(
//             child: SvgPicture.asset(
//               Assets.icons.image.path,
//               color: AppColors.base100.withOpacity(0.7),
//               height: 100,
//               width: 100,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class CustomAssetsImage extends StatelessWidget {
//   final String imagePath;
//   final double height;
//   final double width;

//   const CustomAssetsImage({
//     super.key,
//     required this.imagePath,
//     required this.height,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       imagePath,
//       height: height,
//       width: width,
//       fit: BoxFit.cover,
//       errorBuilder: (context, error, stackTrace) {
//         return Container(
//           color: AppColors.static.withOpacity(0.4),
//           width: width,
//           height: height,
//           child: Center(
//             child: SvgPicture.asset(
//               Assets.icons.image.path,
//               color: AppColors.base100.withOpacity(0.7),
//               height: 100,
//               width: 100,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

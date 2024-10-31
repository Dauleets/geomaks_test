// // ignore_for_file: use_build_context_synchronously, deprecated_member_use

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geomaks_test/src/core/gen/assets.gen.dart';
// import 'package:geomaks_test/src/core/resources/resources.dart';
// import 'package:geomaks_test/src/feature/app/widgets/custom_button.dart';
// import 'package:geomaks_test/src/feature/app/widgets/customs/custom_snackbars.dart';
// import 'package:geomaks_test/src/feature/app/widgets/simple_container.dart';
// import 'package:image_picker/image_picker.dart';

// // ignore: must_be_immutable
// class EditAvatarBottomSheet extends StatefulWidget {
//   final Function(XFile file)? onTap;
//   const EditAvatarBottomSheet({super.key, required this.onTap});

//   static Future<void> show(
//     BuildContext context, {
//     Function(XFile file)? onTap,
//   }) async =>
//       showModalBottomSheet<_No>(
//         context: context,
//         barrierColor: AppColors.base100.withOpacity(0.6),
//         isScrollControlled: true,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//         useRootNavigator: true,
//         builder: (_) => EditAvatarBottomSheet(
//           onTap: onTap,
//         ),
//       );
//   @override
//   State<EditAvatarBottomSheet> createState() => _EditAvatarBottomSheetState();
// }

// class _No {}

// class _EditAvatarBottomSheetState extends State<EditAvatarBottomSheet> {
//   XFile? photo;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.25,
//       decoration: const BoxDecoration(
//         color: AppColors.base900,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           topRight: Radius.circular(16),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min, // Установлено здесь
//             children: [
//               Center(
//                 child: SimpleContainer(
//                   color: AppColors.base100,
//                   width: 48,
//                   borderRadius: BorderRadius.circular(5),
//                   height: 4,
//                   boxShadow: const [],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Select photo',
//                     style: AppTextStyles.m24w600
//                         .copyWith(color: AppColors.base100),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         photo = null;
//                       });

//                       Navigator.pop(context);
//                     },
//                     child: SvgPicture.asset(
//                       Assets.icons.closeCircle.path,
//                       color: AppColors.base100,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomButton(
//                     width: MediaQuery.of(context).size.width * 0.44,
//                     height: 51,
//                     onPressed: () {
//                       pickAvatar(
//                         ImageSource.camera,
//                       ).whenComplete(() {
//                         context.router.maybePop();
//                         setState(() {});
//                       });
//                     },
//                     style: CustomButtonStyles.primaryButtonStyle(context,
//                         backgroundColor: AppColors.mainColor),
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Camera',
//                             style: AppTextStyles.m16w400
//                                 .copyWith(color: AppColors.base100),
//                           ),
//                           const SizedBox(width: 10),
//                           SvgPicture.asset(
//                             Assets.icons.camera.path,
//                             height: 20,
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   CustomButton(
//                     width: MediaQuery.of(context).size.width * 0.44,
//                     height: 51,
//                     onPressed: () {
//                       pickAvatar(
//                         ImageSource.gallery,
//                       ).whenComplete(() {
//                         context.router.maybePop();
//                         setState(() {});
//                       });
//                     },
//                     style: CustomButtonStyles.greenWithBorderButtonStyle(
//                         context,
//                         color: AppColors.base100,
//                         bgColors: Colors.transparent),
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Gallery',
//                             style: AppTextStyles.m16w400
//                                 .copyWith(color: AppColors.base100),
//                           ),
//                           const SizedBox(width: 10),
//                           SvgPicture.asset(
//                             Assets.icons.image.path,
//                             height: 20,
//                             width: 20,
//                             color: AppColors.base100,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future pickAvatar(ImageSource source, {int? isDoc}) async {
//     try {
//       final avatar = await ImagePicker().pickImage(source: source);
//       if (avatar == null) return;

//       final imageTemporary = XFile(avatar.path);
//       setState(() {
//         photo = imageTemporary;
//       });
//       if (photo != null) {
//         widget.onTap!.call(photo!);
//       }
//     } on PlatformException catch (e) {
//       debugPrint('Failed to pick image: $e');
//        showErrorToast(context, message: 'Failed to pick image: $e');
//     }
//   }
// }


//   Future<void> pickListImage(BuildContext context, {required Function(List<XFile>) listImagesAddd}) async {
//     try {
//       final List<XFile> images = await ImagePicker().pickMultiImage();

//       if (images.isEmpty) {
//         return;
//       }
//       // TODO:
//       // setState(() {
//       //   listCover.addAll(images);
//       // });
//       listImagesAddd.call(images);
//     } on PlatformException catch (e) {
//       debugPrint('Failed to pick image: $e');
//       showErrorToast(context, message: 'Failed to pick image: $e');
//     }
//   }


//     Future<void> pickVideo(BuildContext context,{required Function(XFile) photoSave}) async {
//     try {
//       final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

//       // Если видео не выбрано, выполняем pop
//       if (video == null) {
//         Navigator.of(context).pop();
//         return;
//       }

//       final videoTemporary = XFile(video.path);
//       // setState(() {
//       //   photo = videoTemporary;
//       // });
//       photoSave.call(videoTemporary);
//     } on PlatformException catch (e) {
//       debugPrint('Failed to pick video: $e');
//       showErrorToast(context, message: 'Failed to pick video: $e');
//     }
//   }
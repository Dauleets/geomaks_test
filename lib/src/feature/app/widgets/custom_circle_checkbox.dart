// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geomaks_test/src/core/gen/assets.gen.dart';

// class CircularCheckbox extends StatelessWidget {
//   final bool isChecked;
//   final Function(bool) onTap;
//   const CircularCheckbox({
//     super.key,
//     required this.isChecked,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           onTap.call(!isChecked);
//         },
//         child: isChecked
//             ? SvgPicture.asset(Assets.icons.activeCheckboxCircle.path)
//             : SvgPicture.asset(Assets.icons.inactiveCheckboxCircle.path));
//   }
// }

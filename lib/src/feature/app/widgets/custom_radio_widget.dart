// import 'package:geomaks_test/src/core/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomRadio extends StatefulWidget {
//   final double size;
//   final int value;
//   final int? groupValue;
//   final int? index;
//   final void Function(int) onChanged;
//   final bool checkIcon;
//   const CustomRadio({
//     super.key,
//     required this.value,
//     this.groupValue,
//     this.index,
//     required this.onChanged,
//     this.size = 22.0,
//     this.checkIcon = true,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _CustomRadioState createState() => _CustomRadioState();
// }

// class _CustomRadioState extends State<CustomRadio> {
//   bool? isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         widget.onChanged.call(widget.value);
//       },
//       child: Container(
//         width: widget.size,
//         height: widget.size,
//         // padding: const EdgeInsets.all(6),
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(255, 255, 255, 0.19),
//           shape: BoxShape.circle,
//           border: widget.checkIcon
//               ? null
//               : Border.all(color: Color.fromRGBO(224, 224, 224, 1)),
//         ),

//         child: Center(
//           child: widget.checkIcon
//               ? Container(
//                   height: widget.size,
//                   width: widget.size,
//                   child: SvgPicture.asset(Assets.icons.succes.path))
//               : SvgPicture.asset(
//                   Assets.icons.radiobutton.path,
//                   color: Color.fromRGBO(255, 255, 255, 0.19),
//                 ),
//         ),
//       ),
//     );
//   }
// }

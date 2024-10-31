import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? repeatController;
  final void Function(String)? onFieldSubmitted;
  final int? maxLength;
  final Color? fillColor;
  final TextAlign textAlign;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final String? suffixText;
  final Function()? onEditingComplete;
  final BorderRadius? borderR;
  final Widget? label;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry contentPadding;
  final TextInputAction? textInputAction;
  final String obscuringCharacter;
  final String? errortext;
  final int? errorMaxLines;
  final TextStyle? errorStyle;
  final String? counterText;
  final Function()? onTap;
  final bool readOnly;
  final bool? enabled;
  final bool? isError;
  final InputBorder? border; 
  final InputBorder? errorBorder;

  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.height,
    this.width,
    this.keyboardType,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    this.repeatController,
    this.obscureText,
    this.suffix,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.maxLength,
    this.fillColor = Colors.white,
    this.onEditingComplete,
    this.suffixIconConstraints,
    this.textAlign = TextAlign.start,
    this.suffixText,
    this.textStyle,
    this.hintStyle,
    this.borderR,
    this.label,
    this.autofocus = false,
    this.focusNode,
    this.prefix,
    this.prefixIconConstraints,
    required this.contentPadding,
    this.textInputAction,
    this.obscuringCharacter = '●',
    this.errorMaxLines,
    this.errorStyle,
    this.minLines,
    this.counterText,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.border,
    this.errorBorder,
    this.errortext,
    this.isError = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    widget.focusNode?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextField(
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus,
            onEditingComplete: widget.onEditingComplete,
            autocorrect: false,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText ?? false,
            obscuringCharacter: widget.obscuringCharacter,
            style: widget.textStyle ??
                const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  inherit: true,
                ),
            inputFormatters: widget.inputFormatters,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            maxLines: widget.maxLines,
            cursorColor: Colors.white,
            minLines: widget.minLines,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            onChanged: widget.onChanged,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 0.1),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    inherit: true,
                  ),
              contentPadding: widget.contentPadding,
              border: widget.border ??
                  OutlineInputBorder(
                   
                    borderRadius: widget.borderR ?? BorderRadius.circular(16),
                  ),
              focusedBorder: widget.border ??
                  OutlineInputBorder(
                    
                    borderRadius: widget.borderR ?? BorderRadius.circular(16),
                  ),
              enabledBorder: widget.border ??
                  OutlineInputBorder(
                   
                    borderRadius: widget.borderR ?? BorderRadius.circular(16),
                  ),
              focusedErrorBorder: widget.border ??
                  OutlineInputBorder(
                   
                    borderRadius: widget.borderR ?? BorderRadius.circular(16),
                  ),
              disabledBorder: widget.border ??
                  OutlineInputBorder(
                   
                    borderRadius: widget.borderR ?? BorderRadius.circular(16),
                  ),
              errorBorder: widget.errorBorder ??
                  OutlineInputBorder(
                  
                    borderRadius: widget.borderR ?? BorderRadius.circular(16),
                  ),
              prefixIcon: widget.prefixIcon ??
                  (widget.prefix != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: widget.prefix!,
                        )
                      : null),
              counterText: '',
              suffixIcon: widget.suffix,
              
              errorStyle: widget.errorStyle ??
                  const TextStyle(
                    fontSize: 12.0,
                    color: Colors.red,
                    inherit: true,
                  ),
            ),
          ),
        ),
        if (widget.errortext != null && widget.errortext!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              widget.errortext!,
              style: widget.errorStyle ??
                  const TextStyle(
                    fontSize: 12.0,
                    color: Colors.red,
                    inherit: true,
                  ),
            ),
          ),
      ],
    );
  }
}



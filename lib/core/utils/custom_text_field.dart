import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool isObscureText;
  final bool autofocus;
  final bool readOnly;
  final bool isEnabled;
  final bool isTextAria;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final Widget? suffix;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final Color textColor;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final Decoration? decoration;
  final InputBorder? border;

  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.validator,
    this.readOnly = false,
    this.isEnabled = true,
    this.isTextAria = false,
    this.textColor = Colors.black,
    this.suffix,
    this.padding,
    this.focusNode,
    this.onTap,
    this.prefixIcon,
    this.hintStyle,
    this.decoration,
    this.border,
  });

  @override
  State<CustomTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<CustomTextField> {
  bool isVisibleText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: 21.w, vertical: 10.h),
      child: Column(
        textDirection:TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          if (widget.label != null)
            SizedBox(
              height: 8.h,
            ),
          Container(
            decoration: widget.decoration,
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              focusNode: widget.focusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: widget.textInputAction,
              keyboardType: widget.inputType,
              obscureText: widget.isObscureText && !isVisibleText,
              onChanged: (value) {
                setState(() {});
              },
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: widget.textColor,
                    letterSpacing: 1.5,
                  ),
              textDirection: widget.inputType == TextInputType.phone
                  ? TextDirection.ltr
                  : widget.controller.text.isNotEmpty &&
                          widget.controller.text.trim().isNotEmpty
                      ? RegExp(r'^[a-zA-Z0-9٠-٩]')
                              .hasMatch(widget.controller.text)
                          ? TextDirection.ltr
                          : TextDirection.rtl
                      : null,
              maxLines: widget.isTextAria ? 3 : 1,
              decoration: InputDecoration(
                prefixIcon: widget.isObscureText
                    ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibleText = !isVisibleText;
                    });
                  },
                  icon: isVisibleText
                      ? const Icon(
                    CupertinoIcons.eye,
                    color: Colors.grey,
                    textDirection:TextDirection.ltr,
                  )
                      : const Icon(
                    CupertinoIcons.eye_slash,
                    color: Colors.grey,
                    textDirection:TextDirection.ltr,
                  ),
                )
                    :  widget.prefixIcon,
                hintText: widget.hint,
                hintStyle: widget.hintStyle ??
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: widget.textColor,
                        ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 10.h,
                ),
                border: widget.border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                enabledBorder: widget.border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                focusedBorder: widget.border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                // suffixIcon: widget.isObscureText
                //     ? IconButton(
                //         onPressed: () {
                //           setState(() {
                //             isVisibleText = !isVisibleText;
                //           });
                //         },
                //         icon: isVisibleText
                //             ? const Icon(
                //                 CupertinoIcons.eye,
                //                 color: Colors.grey,
                //           textDirection:TextDirection.ltr,
                //               )
                //             : const Icon(
                //                 CupertinoIcons.eye_slash,
                //                 color: Colors.grey,
                //           textDirection:TextDirection.ltr,
                //               ),
                //       )
                //     : widget.suffix,
                errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.lightBlue,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w800,
                    ),
                errorMaxLines: 2,
              ),
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              enabled: widget.isEnabled,
            ),
          ),
        ],
      ),
    );
  }
}

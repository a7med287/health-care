import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

import '../../generated/l10n.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    required this.iconData,
    required this.textInputType,
    required this.hintText,
  });

  final void Function(String?)? onSaved;
  final IconData iconData;
  final TextInputType textInputType;
  final String hintText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).thisIsRequired;
        }
        return null;
      },
      onSaved: widget.onSaved,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.iconData,
          color: isFocused ? AppColors.mainColor : Colors.grey,
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(color:AppColors.mainColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: color),
    );
  }
}

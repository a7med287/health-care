import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, this.onSaved,  this.hintText = "Enter Your Password", this.controller});

  final void Function(String?)? onSaved;
  final String hintText;
  final TextEditingController? controller;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isNotVisible = true;
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
      controller: widget.controller,
      focusNode: focusNode,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).thisIsRequired;
        }
        return null;
      },
      obscureText: isNotVisible,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: isFocused ? AppColors.mainColor : Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isNotVisible = !isNotVisible;
            });
          },
          icon: Icon(
            isNotVisible
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(color: AppColors.mainColor),
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

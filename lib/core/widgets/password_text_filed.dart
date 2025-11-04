import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, this.onSaved});

  final void Function(String?)? onSaved;
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
      focusNode: focusNode,
      validator: (value) {
        if (value!.isEmpty) {
          return "this is required";
        }
        return null;
      },
      obscureText: isNotVisible,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock_outline,
          color: isFocused ? AppColors.primaryColor : Colors.grey,
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
        focusedBorder: buildOutlineInputBorder(color: AppColors.primaryColor),
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

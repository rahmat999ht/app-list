import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormValidate extends StatelessWidget {
  const FormValidate({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.color,
    this.suffixIcon,
    this.isPhone = false,
    this.inputFormatters,
  });

  final String title;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ColorFilter? color;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool isPhone;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Icon(icon),
            const Gap(12),
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        TextFormField(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: context.theme.colorScheme.surface,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: TextInputAction.done,
          validator: validator,
          // onChanged: ,
          inputFormatters: isPhone
              ? [
                  MaskTextInputFormatter(
                    mask: '+62############',
                    filter: {"#": RegExp(r'[0-9]')},
                    initialText: "##",
                    type: MaskAutoCompletionType.eager,
                  ),
                ]
              : inputFormatters,

          decoration: InputDecoration(
            alignLabelWithHint: false,
            hintText: hint,
            helperStyle: context.textTheme.labelLarge,
            suffixIcon: suffixIcon,
            // contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.colorScheme.surface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

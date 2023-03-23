// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {Key? key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.maxLength,
      required this.controller,
      this.obscureText = false})
      : super(key: key);

  final String hint;
  final int maxLines;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          obscureText: obscureText,
          controller: controller,
          enabled: true,
          // keyboardType: TextInputType.text,
          autocorrect: true,
          maxLength: maxLength,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
          cursorColor: Colors.amber,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontFamily: 'cairo', fontSize: 16),
            focusColor: Colors.amber,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.amber,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.amber,
            )),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final void Function(String) onChanged;
  final String? label;
  final String? errorText;
  final String? helperText;

  const PasswordInputField({
    Key? key,
    required this.onChanged,
    this.label,
    this.errorText,
    this.helperText,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: hidden,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          splashRadius: 15,
          icon: Icon(hidden ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              hidden = !hidden;
            });
          },
        ),
        errorText: widget.errorText,
        helperText: widget.helperText,
      ),
    );
  }
}

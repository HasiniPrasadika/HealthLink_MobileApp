import 'package:flutter/material.dart';

class Password_Field extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  const Password_Field({
    super.key,
    required this.icon,
    required this.label,
    this.obscureText = true,
    required this.controller,
    this.validator,
  });

  @override
  State<Password_Field> createState() => _Password_FieldState();
}

class _Password_FieldState extends State<Password_Field> {
  late bool _obscureText;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.006),
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffd6d6d6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                size: size.height * 0.02,
              ),
              hintText: widget.label,
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: size.height * 0.018,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                  size: size.height * 0.02,
                ),
              ),
            ),
            validator: (value) {
              final error = widget.validator?.call(value);
              setState(() {
                _errorText = error;
              });
              return error;
            },
          ),
        ],
      ),
    );
  }
}

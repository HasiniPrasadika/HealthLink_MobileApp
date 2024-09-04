import 'package:flutter/material.dart';

class Custom_Text_Field extends StatefulWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final bool keyboard;
  final String? Function(String?)? validator;
  const Custom_Text_Field({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.keyboard = false,
    this.validator,
  });

  @override
  State<Custom_Text_Field> createState() => _Custom_Text_FieldState();
}

class _Custom_Text_FieldState extends State<Custom_Text_Field> {
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.006),
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.008),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffd6d6d6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType:
                widget.keyboard ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                size: size.height * 0.02,
              ),
              hintText: widget.label,
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: size.height * 0.017),
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

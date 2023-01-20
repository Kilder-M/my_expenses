import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final double? width, height;
  final String labelText;
  final String? initialValue;
  final bool? enable, showCursor;
  final bool readOnly;
  final Widget? prefixIcon, suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textFormFieldController;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const TextFormFieldWidget({
    super.key,
    this.textFormFieldController,
    this.textInputType,
    required this.labelText,
    this.width,
    this.height,
    this.onChanged,
    this.onTap,
    this.enable,
    this.prefixIcon,
    this.inputFormatters,
    this.suffixIcon,
    this.showCursor,
    this.readOnly = false,
    this.initialValue,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          initialValue: initialValue,
          enableInteractiveSelection: false,
          enableIMEPersonalizedLearning: false,
          readOnly: readOnly,
          enabled: enable,
          onTap: onTap,
          inputFormatters: inputFormatters,
          showCursor: showCursor,
          cursorColor: Colors.deepPurple,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          onChanged: onChanged,
          controller: textFormFieldController,
          keyboardType: textInputType,
          decoration: _textFormFieldInputDecoration(),
        ),
      ),
    );
  }

  InputDecoration _textFormFieldInputDecoration() {
    return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      alignLabelWithHint: false,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey[600],
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 117, 117, 117),
          width: 0.3,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 117, 117, 117),
          width: 0.3,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 117, 117, 117),
          width: 0.3,
        ),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 117, 117, 117),
          width: 0.3,
        ),
      ),
    );
  }
}

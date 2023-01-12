import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropDownButtonFormFieldWidget extends StatelessWidget {
  final double? width, height;
  final String labelText;
  final bool? enable, showCursor;
  final Widget? prefixIcon, suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final List<DropdownMenuItem<Object?>>? items;
  final Object? dropDownValue;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final void Function()? onTap;
  final void Function(dynamic)? onChanged;

  const DropDownButtonFormFieldWidget({
    super.key,
    this.width,
    this.height,
    required this.labelText,
    this.enable,
    this.showCursor,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.textInputType,
    this.onTap,
    this.onChanged,
    this.items,
    this.selectedItemBuilder,
    this.dropDownValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: DropdownButtonFormField(
          value: dropDownValue,
          onChanged: onChanged,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          selectedItemBuilder: selectedItemBuilder,
          decoration: _dropDownButtonFormFieldInputDecoration(),
          items: items,
        ),
      ),
    );
  }

  InputDecoration _dropDownButtonFormFieldInputDecoration() {
    return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      alignLabelWithHint: false,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.w600,
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

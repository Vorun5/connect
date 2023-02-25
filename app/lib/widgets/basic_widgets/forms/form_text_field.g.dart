// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_text_field.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required this.name,
    required this.label,
    this.initialValue,
    this.validator,
    this.suffixIcon,
    this.onPressed,
  }) : super(key: key);

  final String name;

  final String label;

  final String? initialValue;

  final String? Function(String?)? validator;

  final IconData? suffixIcon;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext _context) => _formTextField(
        _context,
        name: name,
        label: label,
        initialValue: initialValue,
        validator: validator,
        suffixIcon: suffixIcon,
        onPressed: onPressed,
      );
}

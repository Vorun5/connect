// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_text_area.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class FormTextArea extends StatelessWidget {
  const FormTextArea({
    Key? key,
    required this.label,
    this.name = 'description',
    this.initialValue,
    this.validator,
  }) : super(key: key);

  final String label;

  final String name;

  final String? initialValue;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext _context) => _formTextArea(
        _context,
        label: label,
        name: name,
        initialValue: initialValue,
        validator: validator,
      );
}

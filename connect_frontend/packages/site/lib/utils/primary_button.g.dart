// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_button.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = ColorPalette.secondary})
      : super(key: key);

  final void Function()? onPressed;

  final String text;

  final Color color;

  @override
  Widget build(BuildContext _context) =>
      _primaryButton(onPressed: onPressed, text: text, color: color);
}

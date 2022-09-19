// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_picker.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class DatePicker extends ConsumerWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      _datePicker(_context, _ref);
}

class _Text extends StatelessWidget {
  const _Text(this.data, this.color, {Key? key}) : super(key: key);

  final String data;

  final Color color;

  @override
  Widget build(BuildContext _context) => __text(data, color);
}

class _DatePickerItem extends ConsumerWidget {
  const _DatePickerItem({Key? key, required this.date}) : super(key: key);

  final Date date;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      __datePickerItem(_context, _ref, date: date);
}

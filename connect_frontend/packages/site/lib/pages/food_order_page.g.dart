// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_order_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class FoodOrderPage extends ConsumerWidget {
  const FoodOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      _foodOrderPage(_context, _ref);
}

class _FoodOrderPageHeader extends StatelessWidget {
  const _FoodOrderPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __foodOrderPageHeader();
}

class _Title extends ConsumerWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      __title(_context, _ref);
}

class _Text extends StatelessWidget {
  const _Text(
      {Key? key,
      required this.data,
      required this.color,
      this.underline = false})
      : super(key: key);

  final String data;

  final Color color;

  final bool underline;

  @override
  Widget build(BuildContext _context) =>
      __text(data: data, color: color, underline: underline);
}

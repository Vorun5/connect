// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_body.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MenuBody extends HookWidget {
  const MenuBody(
      {Key? key,
      required this.salads,
      required this.soups,
      required this.secondCourses,
      required this.garnishes,
      required this.backgroundColor})
      : super(key: key);

  final List<Widget> salads;

  final List<Widget> soups;

  final List<Widget> secondCourses;

  final List<Widget> garnishes;

  final Color backgroundColor;

  @override
  Widget build(BuildContext _context) => _menuBody(
      salads: salads,
      soups: soups,
      secondCourses: secondCourses,
      garnishes: garnishes,
      backgroundColor: backgroundColor);
}

class _ColumnDishes extends StatelessWidget {
  const _ColumnDishes({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext _context) => __columnDishes(children: children);
}

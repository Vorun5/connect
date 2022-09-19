// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_card.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class DishCard extends ConsumerWidget {
  const DishCard({Key? key, required this.dish, required this.onTap})
      : super(key: key);

  final DishDto dish;

  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      _dishCard(_context, _ref, dish: dish, onTap: onTap);
}

class _DishCardContent extends StatelessWidget {
  const _DishCardContent(
      {Key? key,
      required this.title,
      required this.supplierName,
      required this.price})
      : super(key: key);

  final String title;

  final String supplierName;

  final double price;

  @override
  Widget build(BuildContext _context) =>
      __dishCardContent(title: title, supplierName: supplierName, price: price);
}

class _DishCardContentEnd extends StatelessWidget {
  const _DishCardContentEnd(
      {Key? key, required this.supplierName, required this.price})
      : super(key: key);

  final String supplierName;

  final double price;

  @override
  Widget build(BuildContext _context) =>
      __dishCardContentEnd(supplierName: supplierName, price: price);
}

class _LikeButton extends StatelessWidget {
  const _LikeButton(
      {Key? key,
      required this.icon,
      required this.colorText,
      required this.text,
      required this.function,
      required this.isHover,
      required this.isTap})
      : super(key: key);

  final Widget icon;

  final Color colorText;

  final String text;

  final void Function() function;

  final bool isHover;

  final bool isTap;

  @override
  Widget build(BuildContext _context) => __likeButton(
      icon: icon,
      colorText: colorText,
      text: text,
      function: function,
      isHover: isHover,
      isTap: isTap);
}

class _LikeAndDislikeRow extends HookWidget {
  const _LikeAndDislikeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __likeAndDislikeRow();
}

class _IconLike extends StatelessWidget {
  const _IconLike(
      {Key? key,
      required this.icon,
      required this.color,
      required this.isHover})
      : super(key: key);

  final IconData icon;

  final Color color;

  final bool isHover;

  @override
  Widget build(BuildContext _context) =>
      __iconLike(icon: icon, color: color, isHover: isHover);
}

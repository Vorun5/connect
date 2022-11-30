// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_drawer.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class UserDrawer extends HookConsumerWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _userDrawer(
        _context,
        _ref,
      );
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext _context) => __drawerHeader(user);
}

class _UserSettings extends HookConsumerWidget {
  const _UserSettings(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __userSettings(
        _context,
        _ref,
        user,
      );
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String text;

  final Icon icon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext _context) => __drawerButton(
        text: text,
        icon: icon,
        onTap: onTap,
      );
}
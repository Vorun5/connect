// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_with_user_settings.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class DrawerWithUserSettings extends HookConsumerWidget {
  const DrawerWithUserSettings({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _drawerWithUserSettings(
        _context,
        _ref,
      );
}

class _UserPreviewProfile extends StatelessWidget {
  const _UserPreviewProfile(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext _context) => __userPreviewProfile(user);
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

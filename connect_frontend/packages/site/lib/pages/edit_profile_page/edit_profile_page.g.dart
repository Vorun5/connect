// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _editProfilePage(
        _context,
        _ref,
      );
}

class _BackgroundWithUserPreview extends StatelessWidget {
  const _BackgroundWithUserPreview(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext _context) => __backgroundWithUserPreview(user);
}

class _UploadBackgroundButton extends HookConsumerWidget {
  const _UploadBackgroundButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __uploadBackgroundButton();
}

class _UploadAvatarButton extends HookConsumerWidget {
  const _UploadAvatarButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __uploadAvatarButton();
}

class _UserPreview extends StatelessWidget {
  const _UserPreview(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext _context) => __userPreview(user);
}

class _ProfileSettings extends StatelessWidget {
  const _ProfileSettings(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext _context) => __profileSettings(
        _context,
        user,
      );
}

class _NameButton extends HookConsumerWidget {
  const _NameButton(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __nameButton(
        _context,
        _ref,
        user,
      );
}

class _UserNameButton extends HookConsumerWidget {
  const _UserNameButton(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __userNameButton(
        _context,
        _ref,
        user,
      );
}

class _SettingButton extends StatelessWidget {
  const _SettingButton({
    Key? key,
    required this.title,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String title;

  final String label;

  final void Function()? onTap;

  @override
  Widget build(BuildContext _context) => __settingButton(
        title: title,
        label: label,
        onTap: onTap,
      );
}

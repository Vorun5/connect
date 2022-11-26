// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class EditProfile extends HookConsumerWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _editProfile(
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

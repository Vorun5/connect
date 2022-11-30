// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_form.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class EditProfileForm extends HookConsumerWidget {
  const EditProfileForm({
    Key? key,
    required this.user,
    required this.newProfileImageUrl,
    required this.newBackgroundUrl,
  }) : super(key: key);

  final User user;

  final String? newProfileImageUrl;

  final String? newBackgroundUrl;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _editProfileForm(
        _context,
        _ref,
        user: user,
        newProfileImageUrl: newProfileImageUrl,
        newBackgroundUrl: newBackgroundUrl,
      );
}

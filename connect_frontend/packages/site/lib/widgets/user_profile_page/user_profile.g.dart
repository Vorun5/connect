// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class UserProfile extends HookConsumerWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _userProfile(
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

class _UserPreview extends StatelessWidget {
  const _UserPreview(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext _context) => __userPreview(user);
}

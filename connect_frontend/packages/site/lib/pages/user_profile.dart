import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/selected_user_profile_provider.dart';
import 'package:site/providers/user_profile_provider.dart';
import 'package:site/utils/screen_layout.dart';
import 'package:site/widgets/error_text.dart';
import 'package:site/widgets/username.dart';

part 'user_profile.g.dart';

@hcwidget
Widget _userProfile(
  BuildContext context,
  WidgetRef ref,
  String username,
) {
  useEffect(
    () {
      ref.read(selectedUserProfileProvider.notifier).state = username;

      return null;
    },
    [],
  );

  final res = ref.watch(userProfileProvider);
  final i18n = Translations.of(context);

  return ScreenLayout(
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'User profile',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          res.when(
            data: (res) {
              final user = res.item1;
              // TODO(Vorun5): обрабатывать другие статусы (404, 500)
              if (user == null) {
                return Center(child: ErrorText(i18n.unknownError));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(user.name),
                  Username(user.username),
                ],
              );
            },
            error: (error, _) => Center(child: ErrorText(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    ),
  );
}

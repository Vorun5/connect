import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/user_profile_provider.dart';
import 'package:site/utils/screen_layout.dart';
import 'package:site/widgets/error_text.dart';

part 'user_profile.g.dart';

@hcwidget
Widget _userProfile(
  BuildContext context,
  WidgetRef ref,
) {
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

              return Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: NetworkImage(
                            user.backgroundImageUrl ??
                                'https://pbs.twimg.com/profile_banners/1389835424865165312/1657992799/1080x360',
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 52,
                              backgroundColor: Colors.amber,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      user.profileImageUrl ??
                                          'https://learn.microsoft.com/en-us/answers/questions/881800/error-updating-profile-image-from-the-portal-of-az.html',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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

import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/my_profile_provider.dart';
import 'package:site/utils/font_size.dart';
import 'package:site/utils/gaps.dart';
import 'package:site/utils/screen_layout.dart';
import 'package:site/widgets/basic_widgets/error_text.dart';
import 'package:site/widgets/basic_widgets/username.dart';

part 'user_profile.g.dart';

const _noAvatarUrl =
    'https://t3.ftcdn.net/jpg/01/09/00/64/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg';
const _noBackgroundUrl1 =
    'https://phonoteka.org/uploads/posts/2021-04/1618400578_38-phonoteka_org-p-tsvetnie-foni-odnogo-tsveta-44.jpg';
const _noBackgroundUrl =
    'https://catherineasquithgallery.com/uploads/posts/2021-03/1614783195_12-p-serie-foni-dlya-saita-12.jpg';

@hcwidget
Widget _userProfile(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);

  return ScreenLayout(
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
      body: user.when(
        data: (user) {
          if (user == null) {
            return Center(child: ErrorText(i18n.unknownError));
          }

          return Column(
            children: [
              _BackgroundWithUserPreview(user),
            ],
          );
        },
        error: (error, _) => Center(child: ErrorText(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}

@swidget
Widget __backgroundWithUserPreview(User user) => Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          user.profileImageUrl ?? _noBackgroundUrl1,
          height: 130,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 123,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 32, 80, 80),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 4),
                  blurRadius: 10,
                  color: Color.fromARGB(255, 18, 44, 44),
                ),
              ],
            ),
            height: 50,
            width: 335,
          ),
        ),
        Positioned(
          top: 88,
          left: 10,
          child: _UserPreview(user),
        ),
      ],
    );

@swidget
Widget __userPreview(User user) => Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color.fromARGB(255, 32, 80, 80),
          child: CircleAvatar(
            radius: 37,
            backgroundImage: NetworkImage(
              user.profileImageUrl ?? _noAvatarUrl,
            ),
          ),
        ),
        Gaps.smallGap,
        Column(
          children: [
            Text(
              style: const TextStyle(fontSize: FontSize.normal),
              user.name,
            ),
            Username(user.username),
          ],
        ),
      ],
    );

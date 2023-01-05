import 'package:app/data/dto/user.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/user_preview.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_profile_page.g.dart';

@hcwidget
Widget _userProfilePage(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);

  return AppScaffold(
    appBar: AppBar(
      title: Text(i18n.screenTitles.userProfile),
      centerTitle: false,
    ),
    body: user.when(
      data: (user) {
        if (user == null) {
          return Center(child: ErrorText(i18n.unknownError));
        }

        final description = user.description;

        return ListView(
          children: [
            _Header(user),
            Gaps.tiny,
            if (description != null && description.isNotEmpty)
              Card(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(Paddings.normal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i18n.userProfile.aboutMe,
                        style: TextStyle(
                          fontSize: FontSize.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gaps.tiny,
                      Text(description),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

@swidget
Widget __header(User user) => Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          user.backgroundImageUrl ?? Constants.noBackground,
          height: Constants.backgroundheight,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Paddings.small,
            right: Paddings.small,
            top: Constants.backgroundheight - Constants.avatarRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserPreview(user),
              Padding(
                padding: const EdgeInsets.only(
                  top: Constants.avatarRadius + Paddings.small,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                ),
              )
            ],
          ),
        ),
      ],
    );

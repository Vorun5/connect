import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/my_profile_provider.dart';
import 'package:site/utils/constants.dart';
import 'package:site/utils/paddings.dart';
import 'package:site/widgets/app_scaffold.dart';
import 'package:site/widgets/basic_widgets/error_text.dart';
import 'package:site/widgets/user_preview.dart';

part 'user_profile_page.g.dart';

@hcwidget
Widget _userProfilePage(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);

  return AppScaffold(
    appBar: AppBar(
      title: const Text('Profile'),
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
            if (description != null)
              Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.onInverseSurface,
                child: Container(
                  padding: const EdgeInsets.all(Paddings.normal),
                  child: Text(description),
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

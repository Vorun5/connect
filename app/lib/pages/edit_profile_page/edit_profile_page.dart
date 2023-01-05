import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/edit_profile_page/edit_profile_form.dart';
import 'package:app/pages/edit_profile_page/edit_profile_header.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'edit_profile_page.g.dart';

@hcwidget
Widget _editProfilePage(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);
  final newProfileImageUrl = useState<String?>(null);
  final newBackgroundUrl = useState<String?>(null);

  return AppScaffold(
    appBar: AppBar(
      title: const Text('edit profile'),
      centerTitle: false,
    ),
    body: user.when(
      data: (user) {
        if (user == null) {
          return Center(child: ErrorText(i18n.unknownError));
        }

        return ListView(
          children: [
            EditProfileheader(
              user: user,
              newBackgroundUrl: newBackgroundUrl.value,
              newProfileImageUrl: newBackgroundUrl.value,
            ),
            const Gap(Constants.avatarRadius),
            EditProfileForm(
              user: user,
              newProfileImageUrl: newProfileImageUrl.value,
              newBackgroundUrl: newBackgroundUrl.value,
            ),
          ],
        );
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

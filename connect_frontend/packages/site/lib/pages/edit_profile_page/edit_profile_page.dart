import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/pages/edit_profile_page/edit_profile_form.dart';
import 'package:site/pages/edit_profile_page/edit_profile_header.dart';
import 'package:site/providers/my_profile_provider.dart';
import 'package:site/utils/constants.dart';
import 'package:site/widgets/app_scaffold.dart';
import 'package:site/widgets/basic_widgets/error_text.dart';

part 'edit_profile_page.g.dart';

final _formKey = GlobalKey<FormBuilderState>();

@hcwidget
Widget _editProfilePage(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);
  final newProfileImageUrl = useState<String?>(null);
  final newBackgroundUrl = useState<String?>(null);

  return AppScaffold(
    appBar: AppBar(title: const Text('Edit Profile')),
    body: user.when(
      data: (user) {
        if (user == null) {
          return Center(child: ErrorText(i18n.unknownError));
        }

        // TODO: присобачиь на вверх
        return SingleChildScrollView(
          child: Column(
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
          ),
        );
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

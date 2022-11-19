import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/providers/my_profile_provider.dart';
import 'package:site/utils/screen_layout.dart';

part 'edit_profile.g.dart';

@hcwidget
Widget _editProfile(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);

  return ScreenLayout(
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
    ),
  );
}

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'login.g.dart';

@hcwidget
Widget _login(BuildContext context, WidgetRef ref) {
  final formKey = GlobalKey<FormBuilderState>();

  return ThemeSwitchingArea(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'text',
                onChanged: print,
              ),
              FormBuilderTextField(
                name: 'name',
                onChanged: print,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'user_profile.g.dart';

@swidget
Widget _userProfile() => ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Profile',
          ),
        ),
      ),
    );

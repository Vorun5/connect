import 'package:app/data/dto/user.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/widgets/avatar.dart';
import 'package:app/widgets/basic_widgets/username.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'user_preview.g.dart';

@swidget
Widget _userPreview(BuildContext context, User user) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Avatar(user.profileImageUrl),
        Gaps.small,
        Text(
          style: const TextStyle(
            fontSize: FontSize.big,
            fontWeight: FontWeight.w500,
          ),
          user.name,
        ),
        Gaps.tiny,
        Username(user.displayUsername),
      ],
    );

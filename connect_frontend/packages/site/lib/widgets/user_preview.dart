import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/utils/constants.dart';
import 'package:site/utils/font_size.dart';
import 'package:site/utils/gaps.dart';
import 'package:site/widgets/basic_widgets/username.dart';

part 'user_preview.g.dart';

@swidget
Widget _userPreview(BuildContext context, User user) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          radius: Constants.avatarRadius + 2,
          child: CircleAvatar(
            backgroundColor: Constants.imageBackgroundColor,
            radius: Constants.avatarRadius,
            backgroundImage: NetworkImage(
              user.profileImageUrl ?? Constants.noAvatar,
            ),
          ),
        ),
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

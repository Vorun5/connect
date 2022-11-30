import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/utils/constants.dart';
import 'package:site/utils/paddings.dart';
import 'package:site/widgets/avatar.dart';
import 'package:site/widgets/upload_image.dart';

part 'edit_profile_header.g.dart';

@swidget
Widget _editProfileheader({
  required User user,
  required String? newProfileImageUrl,
  required String? newBackgroundUrl,
}) =>
    Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          user.backgroundImageUrl ?? Constants.noBackground,
          height: Constants.backgroundheight,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: Paddings.small,
          right: Paddings.small,
          child: UploadImage(url: newBackgroundUrl),
        ),
        Positioned(
          top: Constants.backgroundheight - Constants.avatarRadius,
          left: Paddings.small,
          child: SizedBox(
            height: Constants.avatarRadius * 2,
            width: Constants.avatarRadius * 2,
            child: Stack(
              children: [
                Avatar(user.profileImageUrl),
                Center(child: UploadImage(url: newProfileImageUrl)),
              ],
            ),
          ),
        ),
      ],
    );

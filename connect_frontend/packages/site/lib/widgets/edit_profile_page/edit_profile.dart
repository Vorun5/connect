import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/data/api/api_services.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/my_profile_provider.dart';
import 'package:site/utils/font_size.dart';
import 'package:site/utils/gaps.dart';
import 'package:site/utils/screen_layout.dart';
import 'package:site/widgets/basic_widgets/error_text.dart';
import 'package:site/widgets/basic_widgets/hoverable.dart';
import 'package:site/widgets/basic_widgets/username.dart';

part 'edit_profile.g.dart';

const _noAvatarUrl =
    'https://t3.ftcdn.net/jpg/01/09/00/64/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg';
const _noBackgroundUrl1 =
    'https://phonoteka.org/uploads/posts/2021-04/1618400578_38-phonoteka_org-p-tsvetnie-foni-odnogo-tsveta-44.jpg';
const _noBackgroundUrl =
    'https://catherineasquithgallery.com/uploads/posts/2021-03/1614783195_12-p-serie-foni-dlya-saita-12.jpg';

@hcwidget
Widget _editProfile(BuildContext context, WidgetRef ref) {
  final user = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);

  return ScreenLayout(
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: user.when(
        data: (user) {
          if (user == null) {
            return Center(child: ErrorText(i18n.unknownError));
          }

          return Column(
            children: [
              _BackgroundWithUserPreview(user),
              const Gap(50),
              _ProfileSettings(user),
            ],
          );
        },
        error: (error, _) => Center(child: ErrorText(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}

@swidget
Widget __backgroundWithUserPreview(User user) => Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          user.profileImageUrl ?? _noBackgroundUrl1,
          height: 130,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(139, 158, 158, 158)),
          height: 130,
        ),
        const Positioned(
          right: 5,
          top: 5,
          child: _UploadBackgroundButton(),
        ),
        Positioned(
          top: 123,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 80, 78, 79),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 50,
            width: 300,
          ),
        ),
        Positioned(
          top: 88,
          left: 10,
          child: _UserPreview(user),
        ),
        const Positioned(
          top: 88,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(139, 158, 158, 158),
            radius: 40,
          ),
        ),
        const Positioned(
          top: 112,
          left: 29,
          child: _UploadAvatarButton(),
        ),
      ],
    );

@hcwidget
Widget __uploadBackgroundButton() {
  final url = useState('');

  return IconButton(
    onPressed: () async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'png',
          'jpeg',
          'jpg',
          'gif',
          'raw',
          'tiff',
          'bmp',
          'psd',
        ],
        withData: true,
      );
      await ApiServices.saveBackgroundImage(result);
    }
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: const Text('Изменить фон'),
    //     content: TextField(onChanged: (str) => url.value = str),
    //     actions: [
    //       TextButton(
    //         onPressed: () async {
    //           final result = await FilePicker.platform.pickFiles();
    //           await ApiServices.saveBackgroundImage(result);
    //           Navigator.pop(context, 'OK');
    //         },
    //         child: const Text('OK'),
    //       ),
    //     ],
    //   ),
    // ),
    ,
    icon: const Icon(
      Icons.add_photo_alternate_rounded,
      color: Colors.purple,
      size: 35,
    ),
  );
}

@hcwidget
Widget __uploadAvatarButton() {
  final url = useState('');

  return IconButton(
    onPressed: () async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'png',
          'jpeg',
          'jpg',
          'gif',
          'raw',
          'tiff',
          'bmp',
          'psd',
        ],
        withData: true,
      );
      await ApiServices.saveAvatarImage(result);
    },
    icon: const Icon(
      Icons.add_a_photo,
      color: Colors.deepPurple,
    ),
  );
}

@swidget
Widget __userPreview(User user) => Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 37,
            backgroundImage: NetworkImage(
              user.profileImageUrl ?? _noAvatarUrl,
            ),
          ),
        ),
        Gaps.smallGap,
        Column(
          children: [
            Text(
              style: const TextStyle(fontSize: FontSize.normal),
              user.name,
            ),
            Username(user.username),
          ],
        ),
      ],
    );

@swidget
Widget __profileSettings(BuildContext context, User user) => DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          _SettingButton(
            title: user.name.isEmpty ? 'Не задано' : user.name,
            label: 'Нажмите, чтобы изменить имя',
            onTap: () {},
          ),
          _SettingButton(
            title: user.username.isEmpty ? 'Не задано' : user.username,
            label: 'Нажмите, чтобы изменить имя',
            onTap: () {},
          ),
        ],
      ),
    );

@swidget
Widget __settingButton({
  required String title,
  required String label,
  required void Function()? onTap,
}) =>
    Hoverable(
      child: (isHovered) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isHovered
                ? const Color.fromARGB(71, 168, 65, 154)
                : Colors.transparent,
            // borderRadius: const BorderRadius.all(
            //   Radius.circular(Gaps.small),
            // ),
          ),
          padding: const EdgeInsets.all(Gaps.small),
          child: RichText(
            text: TextSpan(
              text: title,
              style: const TextStyle(fontSize: FontSize.normal),
              children: [
                TextSpan(
                  text: '\n$label',
                  style: TextStyle(
                    color: Colors.blueGrey[400],
                    fontSize: FontSize.small,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

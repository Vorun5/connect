import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
import 'package:site/widgets/basic_widgets/forms/name_field.dart';
import 'package:site/widgets/basic_widgets/forms/username_field.dart';
import 'package:site/widgets/basic_widgets/hoverable.dart';
import 'package:site/widgets/basic_widgets/username.dart';

part 'edit_profile.g.dart';

const _noAvatarUrl =
    'https://t3.ftcdn.net/jpg/01/09/00/64/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg';
const _noBackgroundUrl1 =
    'https://phonoteka.org/uploads/posts/2021-04/1618400578_38-phonoteka_org-p-tsvetnie-foni-odnogo-tsveta-44.jpg';
const _noBackgroundUrl =
    'https://catherineasquithgallery.com/uploads/posts/2021-03/1614783195_12-p-serie-foni-dlya-saita-12.jpg';
final _formKey = GlobalKey<FormBuilderState>();

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
              const Gap(70),
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
              color: Color.fromARGB(255, 32, 80, 80),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 4),
                  blurRadius: 10,
                  color: Color.fromARGB(255, 18, 44, 44),
                ),
              ],
            ),
            height: 50,
            width: 335,
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
      print('ckick');
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'png',
          'jpeg',
          'jpg',
          'gif',
        ],
        // withData: true,
      );
      await ApiServices.saveBackgroundImage(result);
    },
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
          backgroundColor: const Color.fromARGB(255, 32, 80, 80),
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
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 32, 80, 80),
      ),
      child: Column(
        children: [
          _NameButton(user),
          _UserNameButton(user),
        ],
      ),
    );

@hcwidget
Widget __nameButton(BuildContext context, WidgetRef ref, User user) {
  final errorStatus = useState<int?>(0);

  return _SettingButton(
    title: 'Имя',
    label: user.name.isEmpty ? 'Не задано' : user.name,
    onTap: () async => showDialog(
      context: context,
      builder: (context) => FormBuilder(
        key: _formKey,
        child: AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Введите имя'),
              Icon(
                Icons.badge_outlined,
                color: Colors.green,
                size: 30,
              ),
            ],
          ),
          content: const NameField(),
          actions: [
            TextButton(
              onPressed: () async {
                final currentState = _formKey.currentState;

                if (currentState?.saveAndValidate() ?? false) {
                  final value = currentState?.value;
                  if (value != null) {
                    debugPrint(value.toString());
                    errorStatus.value = await ApiServices.updateUserInformation(
                      user.copyWith(name: value['name'] as String),
                    );
                    print(errorStatus.value);

                    if (errorStatus.value == null) {
                      ref.refresh(myProfileProvider);
                    }
                  }
                } else {
                  debugPrint(
                    _formKey.currentState?.value.toString(),
                  );
                  debugPrint('validation failed');
                }
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    ),
  );
}

@hcwidget
Widget __userNameButton(BuildContext context, WidgetRef ref, User user) {
  final errorStatus = useState<int?>(0);

  return _SettingButton(
    title: 'Имя пользователя',
    label: user.username.isEmpty ? 'Не задано' : user.username,
    onTap: () async => showDialog(
      context: context,
      builder: (context) => FormBuilder(
        key: _formKey,
        child: AlertDialog(
          title: Row(
            children: const [
              Expanded(flex: 3, child: Text('Введите имя пользователя')),
              Expanded(
                child: Icon(
                  Icons.alternate_email,
                  color: Colors.blueAccent,
                  size: 30,
                ),
              ),
            ],
          ),
          content: const UsernameField(),
          actions: [
            TextButton(
              onPressed: () async {
                final currentState = _formKey.currentState;

                if (currentState?.saveAndValidate() ?? false) {
                  final value = currentState?.value;
                  if (value != null) {
                    debugPrint(value.toString());
                    errorStatus.value = await ApiServices.updateUserInformation(
                      user.copyWith(username: value['username'] as String),
                    );
                    print(errorStatus.value);

                    if (errorStatus.value == null) {
                      ref.refresh(myProfileProvider);
                    }
                  }
                } else {
                  debugPrint(
                    _formKey.currentState?.value.toString(),
                  );
                  debugPrint('validation failed');
                }
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    ),
  );
}

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
          ),
          padding: const EdgeInsets.all(Gaps.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: FontSize.normal,
                  color: Colors.amberAccent,
                  shadows: [Shadow(offset: Offset(1, 4), blurRadius: 3)],
                ),
              ),
              Text(label, style: const TextStyle(fontSize: FontSize.normal)),
            ],
          ),
        ),
      ),
    );

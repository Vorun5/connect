import 'package:another_flushbar/flushbar.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/providers/selected_event.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/avatar.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/basic_widgets/username.dart';
import 'package:app/widgets/event_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'event_page.g.dart';

@hcwidget
Widget _eventPage(BuildContext context, WidgetRef ref) {
  final i18n = Translations.of(context);
  final selectedEvent = ref.watch(selectedEventProvider);
  final myProfile = ref.watch(myProfileProvider);
  final deletedUsers = useState<List<String>>([]);
  return AppScaffold(
    appBar: AppBar(
      title: const Text('Event'),
      centerTitle: false,
    ),
    body: selectedEvent.when(
      data: (data) {
        final event = data.item1;
        final errorCode = data.item2;

        if (myProfile.value == null || (event == null && errorCode == null)) {
          return const Center(child: CircularProgressIndicator());
        }

        if (event != null) {
          final iAmCreator = event.idCreator == myProfile.value!.id;
          return ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.network(
                    event.imageUrl ?? Constants.noEventImage,
                    height: Constants.backgroundHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (iAmCreator)
                    Positioned(
                      top: Paddings.small,
                      right: Paddings.small,
                      child: IconButton(
                        icon: const Icon(Icons.edit_rounded),
                        onPressed: () {
                          eventForm(
                            context,
                            ref,
                            initialValue: event,
                            isCreate: false,
                          );
                        },
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Paddings.normal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.small,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Paddings.small - 2,
                      ),
                      child: Text(
                        event.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Gaps.small,
                    if (event.description != null &&
                        event.description!.isNotEmpty)
                      Card(
                        color: const Color.fromARGB(71, 168, 65, 154),
                        elevation: 0,
                        child: Container(
                          width: 500,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Описание',
                                style: TextStyle(
                                  fontSize: FontSize.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gaps.tiny,
                              Text(event.description!),
                            ],
                          ),
                        ),
                      ),
                    Gaps.small,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Paddings.small - 2,
                      ),
                      child: Text(
                        'Участники:',
                        style: TextStyle(fontSize: FontSize.big),
                      ),
                    ),
                    Gaps.small,
                    ...event.users.map(
                      (user) => _User(
                        user: user.user,
                        isUser: event.idCreator != user.user.id,
                        isCreator: event.idCreator == user.user.id,
                        iAmCreator: iAmCreator,
                        event: event,
                      ),
                    ),
                    if (iAmCreator && event.usersWhoWantToJoin.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gaps.small,
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Paddings.small - 2,
                            ),
                            child: Text(
                              'Пользователи, желающие вступить:',
                              style: TextStyle(fontSize: FontSize.big),
                            ),
                          ),
                          Gaps.small,
                          ...event.usersWhoWantToJoin
                              .map(
                                (user) => _User(
                                  user: user,
                                  isWaiting: true,
                                  event: event,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    Gaps.small,
                    OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              iAmCreator
                                  ? 'Вы точно хотите удалить мероприятие?'
                                  : 'Вы точно хотите покинуть мероприятие?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  if (iAmCreator) {
                                    final result =
                                        await ApiServices.removeEvent(event.id);
                                    if (result == 200) {
                                      // ignore: use_build_context_synchronously
                                      context.goNamed('home');
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      Flushbar(
                                        backgroundColor: Colors.red,
                                        message:
                                            'Не удалось удалить мероприятие',
                                        duration: const Duration(seconds: 3),
                                      ).show(context);
                                    }
                                  } else {
                                    final result =
                                        await ApiServices.leaveFromEvent(
                                      event.id,
                                    );
                                    if (result == 200) {
                                      // ignore: use_build_context_synchronously
                                      context.goNamed('home');
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      Flushbar(
                                        backgroundColor: Colors.red,
                                        message:
                                            'Не удалось покинуть мероприятие',
                                        duration: const Duration(seconds: 3),
                                      ).show(context);
                                    }
                                  }
                                },
                                child: Text(
                                  iAmCreator ? 'Удалить' : 'Покинуть',
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(i18n.buttons.close),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        iAmCreator
                            ? 'Удалить мероприятие'
                            : 'Выйти из мероприятия',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (errorCode != null) {
          return Center(
            child: Text(data.item2.toString()),
          );
        }

        return const Center(child: ErrorText('Что-то пошло не так'));
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

@hcwidget
Widget __user(
  BuildContext context,
  WidgetRef ref, {
  required User user,
  bool isUser = false,
  bool isCreator = false,
  bool iAmCreator = false,
  bool isWaiting = false,
  required Event event,
}) {
  return Card(
    //color: const Color.fromARGB(71, 168, 65, 154),
    child: Padding(
      padding: const EdgeInsets.all(Paddings.small),
      child: Row(
        children: [
          Avatar(
            user.profileImageUrl,
            radius: 25,
          ),
          Gaps.small,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: FontSize.normal,
                  ),
                ),
                const Gap(2),
                Username(user.displayUsername),
              ],
            ),
          ),
          if (isWaiting)
            IconButton(
              onPressed: () async {
                final result = await ApiServices.addUsersToEvent(
                  event.id,
                  [user.id],
                );
                if (result == 200) {
                  ref.read(selectedEventProvider.notifier).refresh(event.id);
                  return;
                }
                // ignore: use_build_context_synchronously
                Flushbar(
                  backgroundColor: Colors.red,
                  message: 'Что-то пошло не так. Статус ошибки $result',
                  duration: const Duration(seconds: 3),
                ).show(context);
              },
              icon: const Icon(
                Icons.add_circle_sharp,
              ),
            ),
          if (isUser && iAmCreator)
            IconButton(
              onPressed: () async {
                final result = await ApiServices.removeUsersFromEvents(
                  event.id,
                  [user.id],
                );
                if (result == 200) {
                  ref.read(selectedEventProvider.notifier).refresh(event.id);
                  return;
                }
                // ignore: use_build_context_synchronously
                Flushbar(
                  backgroundColor: Colors.red,
                  message: 'Что-то пошло не так. Статус ошибки $result',
                  duration: const Duration(seconds: 3),
                ).show(context);
              },
              icon: const Icon(
                Icons.remove_circle_sharp,
              ),
            ),
          if (isCreator)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.admin_panel_settings_sharp,
              ),
            ),
        ],
      ),
    ),
  );
}

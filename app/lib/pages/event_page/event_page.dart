import 'package:another_flushbar/flushbar.dart';
import 'package:app/data/api/api_services.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
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
          return ListView(
            children: [
              Image.network(
                event.imageUrl ?? Constants.noEventImage,
                height: Constants.backgroundHeight,
                width: double.infinity,
                fit: BoxFit.cover,
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
                          fontWeight: FontWeight.w500,
                          fontSize: FontSize.large,
                        ),
                      ),
                    ),
                    Gaps.small,
                    if (event.description != null &&
                        event.description!.isNotEmpty)
                      Card(
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.all(Paddings.normal),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Описание',
                                style: TextStyle(
                                  fontSize: FontSize.normal,
                                  fontWeight: FontWeight.w500,
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
                    ...event.users.map((user) {
                      if (deletedUsers.value.contains(user.user.id)) {
                        return Container();
                      }

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(Paddings.small),
                          child: Row(
                            children: [
                              Avatar(
                                user.user.profileImageUrl,
                                radius: 25,
                              ),
                              Gaps.small,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.user.name,
                                      style: const TextStyle(
                                        fontSize: FontSize.normal,
                                      ),
                                    ),
                                    const Gap(2),
                                    Username(user.user.displayUsername),
                                  ],
                                ),
                              ),
                              if (event.idCreator == user.user.id)
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.admin_panel_settings_sharp,
                                  ),
                                ),
                              if (event.idCreator != user.user.id &&
                                  event.idCreator == myProfile.value!.id)
                                IconButton(
                                  onPressed: () async {
                                    final result =
                                        await ApiServices.removeUsersFromEvents(
                                      event.id,
                                      [user.user.id],
                                    );
                                    if (result == 200) {
                                      deletedUsers.value.add(user.user.id);
                                      return;
                                    }
                                    // ignore: use_build_context_synchronously
                                    Flushbar(
                                      backgroundColor: Colors.red,
                                      message:
                                          'Что-то пошло не так. Статус ошибки $result',
                                      duration: const Duration(seconds: 3),
                                    ).show(context);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_sharp,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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

// @hcwidget
// Widget _eventPage(BuildContext context, WidgetRef ref) {
//   final i18n = Translations.of(context);
//   final selectedEvent = ref.watch(selectedEventProvider);

//   return AppScaffold(
//     appBar: AppBar(
//       title: const Text('Event'),
//       centerTitle: false,
//     ),
//     body: selectedEvent.when(
//       data: (data) {
//         final event = data.item1;
//         final errorCode = data.item2;

//         if (event == null && errorCode == null) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (event != null) {
//           return Center(
//             child: ListView(children: [
//               Text(event.name),
//               Text(event.unreadMessages.toString()),
//               Text(event.description.toString()),
//               Text(event.date.toString()),
//               Wrap(
//                 children: event.users
//                     .map((user) => Text(user.user.displayUsername))
//                     .toList(),
//               ),
//               OutlinedButton(
//                 onPressed: () async {
//                   final result = await ApiServices.removeEvent(event.id);
//                   if (result == 200) {
//                     // ignore: use_build_context_synchronously
//                     context.goNamed('home');
//                   } else {
//                     // ignore: use_build_context_synchronously
//                     Flushbar(
//                       backgroundColor: Colors.red,
//                       message: 'Не удалось удалить мероприятие',
//                       duration: const Duration(seconds: 3),
//                     ).show(context);
//                   }
//                 },
//                 child: const Text('Удалить мероприятие!'),
//               )
//             ]),
//           );
//         }
//         if (errorCode != null) {
//           return Center(
//             child: Text(data.item2.toString()),
//           );
//         }

//         return const Center(child: ErrorText('Что-то пошло не так'));
//       },
//       error: (error, _) => Center(child: ErrorText(error.toString())),
//       loading: () => const Center(child: CircularProgressIndicator()),
//     ),
//   );
// }

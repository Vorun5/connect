import 'package:another_flushbar/flushbar.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/selected_event.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'event_page.g.dart';

@hcwidget
Widget _eventPage(BuildContext context, WidgetRef ref) {
  final i18n = Translations.of(context);
  final selectedEvent = ref.watch(selectedEventProvider);

  return AppScaffold(
    appBar: AppBar(
      title: const Text('Event'),
      centerTitle: false,
    ),
    body: selectedEvent.when(
      data: (data) {
        final event = data.item1;
        final errorCode = data.item2;

        if (event == null && errorCode == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (event != null) {
          return Center(
            child: ListView(children: [
              Text(event.name),
              Text(event.unreadMessages.toString()),
              Text(event.description.toString()),
              Text(event.date.toString()),
              Wrap(
                children: event.users
                    .map((user) => Text(user.user.displayUsername))
                    .toList(),
              ),
              OutlinedButton(
                onPressed: () async {
                  final result = await ApiServices.removeEvent(event.id);
                  if (result == 200) {
                    // ignore: use_build_context_synchronously
                    context.goNamed('home');
                  } else {
                    // ignore: use_build_context_synchronously
                    Flushbar(
                      backgroundColor: Colors.red,
                      message: 'Не удалось удалить мероприятие',
                      duration: const Duration(seconds: 1),
                    ).show(context);
                  }
                },
                child: const Text('Удалить мероприятие!'),
              )
            ]),
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

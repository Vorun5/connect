import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/my_events.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/event_card.dart';
import 'package:app/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_page.g.dart';

@hcwidget
Widget _homePage(BuildContext context, WidgetRef ref) {
  final i18n = Translations.of(context);
  final events = ref.watch(myEventsProvider);

  return AppScaffold(
    drawer: const UserDrawer(),
    appBar: AppBar(
      title: Text(i18n.screenTitles.allEvents),
      centerTitle: false,
    ),
    body: events.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(
            child: Text('У вас нет мероприятий'),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(Paddings.small),
          children: data.map((event) => EventCard(event)).toList(),
        );
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

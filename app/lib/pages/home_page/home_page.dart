import 'package:another_flushbar/flushbar.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_preview.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/event_statistic.dart';
import 'package:app/providers/my_events.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:app/widgets/event_card.dart';
import 'package:app/widgets/user_drawer.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_page.g.dart';

@hcwidget
Widget _homePage(BuildContext context, WidgetRef ref) {
  final i18n = Translations.of(context);
  final events = ref.watch(myEventsProvider);
  final formKey = GlobalKey<FormBuilderState>();
  final searchEvents = useState<List<EventPreview>?>(null);
  final statistic = ref.watch(eventStatisticProvider).value;

  return AppScaffold(
    drawer: const UserDrawer(),
    appBar: AppBar(
      title: Text(i18n.screenTitles.allEvents),
      centerTitle: false,
    ),
    body: events.when(
      data: (data) {
        return ListView(
          padding: const EdgeInsets.all(Paddings.small),
          children: [
            if (statistic != null && statistic.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Всего мероприятий ${statistic.map((e) => e.count).toList().reduce((value, e) => value + e)}',
                  ),
                  Text(
                    'Открытых мероприятий ${statistic.firstWhereOrNull((e) => e.entryAfterAdminApproval)?.count}',
                  ),
                  Text(
                    'Мероприятий после одобрения ${statistic.firstWhereOrNull((e) => !e.entryAfterAdminApproval)?.count}',
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Paddings.tiny),
              child: FormBuilder(
                key: formKey,
                child: FormTextField(
                  name: 'search',
                  label: i18n.form.labels.searchEventByName,
                  suffixIcon: Icons.search,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  onPressed: () async {
                    final currentState = formKey.currentState;

                    if (currentState?.saveAndValidate() ?? false) {
                      final value = currentState?.value;
                      if (value != null) {
                        searchEvents.value = await ApiServices.searchEvents(
                          value['search'] as String,
                        );
                      }
                    } else {
                      debugPrint(
                        formKey.currentState?.value.toString(),
                      );
                      debugPrint('validation failed');
                    }
                  },
                ),
              ),
            ),
            if (searchEvents.value != null && searchEvents.value!.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i18n.homePage.eventNotFound,
                  style: const TextStyle(
                      fontSize: FontSize.big, fontWeight: FontWeight.bold),
                ),
              ),
            if (searchEvents.value != null && searchEvents.value!.isNotEmpty)
              ...searchEvents.value!
                  .map(
                    (event) => Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Paddings.tiny),
                      child: EventCard(
                        event,
                        actionText: event.entryAfterAdminApproval
                            ? i18n.homePage.application
                            : i18n.homePage.join,
                        action: () async {
                          final result =
                              await ApiServices.joinToEvent(event.id);
                          if (result == 200) {
                            // ignore: use_build_context_synchronously
                            context.goNamed(
                              'event',
                              params: {'id': event.id},
                            );
                            return;
                          }
                          var color = Colors.black;
                          var text = "не обработанный случай";
                          if (result == 202) {
                            color = Colors.greenAccent;
                            text = "Заявка на добавление принята!";
                            ref.read(myEventsProvider.notifier).refresh();
                          }
                          if (result == 400) {
                            color = Colors.orangeAccent;
                            text = "Вы уже участник этого мероприятия!";
                            if (event.entryAfterAdminApproval) {
                              text = "Вы уже в списке ожидания!";
                            }
                          }
                          if (result == 404) {
                            color = Colors.redAccent;
                            text = "Мероприятие не найдено!";
                          }
                          if (result == 500) {
                            color = Colors.redAccent;
                            text = "Ошибка сервера( sorry";
                          }
                          Flushbar(
                            backgroundColor: color,
                            message: text,
                            duration: const Duration(seconds: 3),
                          ).show(context);
                        },
                      ),
                    ),
                  )
                  .toList(),
            Gaps.normal,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Paddings.tiny),
              child: Text(
                i18n.homePage.myEvents,
                style: const TextStyle(fontSize: FontSize.big),
              ),
            ),
            Gaps.small,
            if (data.isEmpty)
              Center(
                child: Text(i18n.homePage.noEvents),
              )
            else
              ...data
                  .map((event) => EventCard(
                        event,
                        onTap: () => context.goNamed(
                          'event',
                          params: {'id': event.id},
                        ),
                      ))
                  .toList(),
          ],
        );
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

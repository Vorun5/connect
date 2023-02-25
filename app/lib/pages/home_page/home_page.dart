// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_preview.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/my_events.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:app/widgets/event_card.dart';
import 'package:app/widgets/user_drawer.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Paddings.tiny),
              child: FormBuilder(
                key: formKey,
                child: FormTextField(
                  name: 'search',
                  label: 'Search event by name',
                  suffixIcon: Icons.search,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
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
              const Text('Ничего не найдено!'),
            if (searchEvents.value != null && searchEvents.value!.isNotEmpty)
              ...searchEvents.value!
                  .map(
                    (event) => Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Paddings.tiny),
                      child: EventCard(
                        event,
                        actionText: event.entryAfterAdminApproval
                            ? "Подать заявку"
                            : "Вступить",
                        action: () async {
                          final result =
                              await ApiServices.joinToEvent(event.id);
                          if (result == 202) {
                            Flushbar(
                              backgroundColor: Colors.green,
                              message: 'Заявка на добавление отправлена',
                              duration: const Duration(seconds: 3),
                            ).show(context);
                            return;
                          }
                          if (result == 200) {
                            context.goNamed(
                              'event',
                              params: {'id': event.id},
                            );
                            return;
                          }
                          Flushbar(
                            backgroundColor: Colors.red,
                            message: result.toString(),
                            duration: const Duration(seconds: 3),
                          ).show(context);
                        },
                      ),
                    ),
                  )
                  .toList(),
            Gaps.normal,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Paddings.tiny),
              child: Text(
                'My events',
                style: TextStyle(fontSize: FontSize.big),
              ),
            ),
            Gaps.small,
            if (data.isEmpty)
              const Center(
                child: Text('У вас нет мероприятий'),
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

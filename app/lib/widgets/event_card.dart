import 'package:app/data/dto/event_preview.dart';
import 'package:app/utils/paddings.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'event_card.g.dart';

@swidget
Widget _eventCard(
  BuildContext context,
  EventPreview event, {
  void Function()? onTap,
  String? actionText,
  void Function()? action,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(Paddings.small),
        child: Column(
          children: [
            Text('Название: ${event.name}'),
            Text('Описание: ${event.description}'),
            Text('Количество пользователей: ${event.userCount}'),
            Text('URL фото: ${event.imageUrl}'),
            Text('Время: ${event.date}'),
            Text('После одобрения админа: ${event.entryAfterAdminApproval}'),
            const Text('Теги:'),
            Row(
              children: event.tags
                  .map(
                    (tag) => Text(tag.name),
                  )
                  .toList(),
            ),
            if (actionText != null)
              OutlinedButton(onPressed: action, child: Text(actionText)),
          ],
        ),
      ),
    ),
  );
}

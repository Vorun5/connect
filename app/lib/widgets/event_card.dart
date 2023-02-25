import 'package:app/data/dto/event_preview.dart';
import 'package:app/utils/paddings.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';

part 'event_card.g.dart';

@swidget
Widget _eventCard(BuildContext context, EventPreview event) {
  return GestureDetector(
    onTap: () => context.goNamed(
      'event',
      params: {'id': event.id},
    ),
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
            Text('Непрочитанных сообщений: ${event.unreadMessages}'),
            const Text('Теги:'),
            Row(
              children: event.tags
                  .map(
                    (tag) => Text(tag.name),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    ),
  );
}

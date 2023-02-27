import 'package:app/data/dto/event_preview.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
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
        padding: const EdgeInsets.symmetric(
            vertical: Paddings.small, horizontal: Paddings.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        event.imageUrl ?? Constants.noEventImage,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      Gaps.small,
                      Row(
                        children: [
                          const Icon(Icons.person),
                          Text(
                            ' ${event.userCount}',
                            style: const TextStyle(
                              fontSize: FontSize.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Gaps.normal,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        event.name,
                        style: const TextStyle(fontSize: FontSize.big),
                        maxLines: 30,
                        overflow: TextOverflow.fade,
                      ),
                      Gaps.small,
                      if (event.description != null)
                        Text(
                          event.description!,
                          maxLines: 30,
                          overflow: TextOverflow.fade,
                        ),
                      Gaps.normal,
                      Wrap(
                        spacing: Paddings.tiny,
                        runSpacing: Paddings.tiny,
                        children: event.tags.map(
                          (tag) {
                            return Chip(
                              label: Text(tag.name),
                              onDeleted: null,
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Gaps.small,
            if (actionText != null)
              Padding(
                padding: const EdgeInsets.only(top: Paddings.small),
                child: OutlinedButton(
                  onPressed: action,
                  child: Text(actionText),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

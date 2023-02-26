import 'package:app/data/dto/event_preview.dart';
import 'package:app/utils/paddings.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.assistant_photo_rounded, color: Colors.pink),
                Text(
                  event.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                const Icon(Icons.assistant_photo_rounded, color: Colors.pink)
              ],
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            const Gap(10),
            Text('${event.description}', style: const TextStyle(fontSize: 17)),
            const Gap(10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  const Icon(Icons.child_care_sharp,
                      size: 30, color: Colors.amber),
                  const Gap(5),
                  Text(event.userCount.toString(),
                      style: const TextStyle(
                          fontSize: 17, decoration: TextDecoration.underline))
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time,
                      size: 30, color: Colors.lightBlue),
                  const Gap(5),
                  Text(event.date.toString(),
                      style: const TextStyle(
                          fontSize: 17, decoration: TextDecoration.underline))
                ],
              ),
              event.entryAfterAdminApproval
                  ? const Icon(Icons.person_add_alt_outlined,
                      size: 30, color: Colors.greenAccent)
                  : const Icon(Icons.person_add_disabled_outlined,
                      size: 30, color: Colors.redAccent)
            ]),
            const Gap(12),
            //Text('URL фото: ${event.imageUrl}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: event.tags
                  .map(
                    (tag) => Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(126, 202, 202, 202),
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(tag.name,
                              style: const TextStyle(fontSize: 17)),
                        )),
                  )
                  .toList(),
            ),
            if (actionText != null) const Gap(10),
            if (actionText != null)
              OutlinedButton(onPressed: action, child: Text(actionText))
          ],
        ),
      ),
    ),
  );
}

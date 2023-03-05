import 'package:app/data/dto/event_preview.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/widgets/basic_widgets/hoverable.dart';
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
}) =>
    Hoverable(
        child: (isHovered) => GestureDetector(
              onTap: onTap,
              child: Card(
                color: const Color.fromARGB(71, 168, 65, 154),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                    event.entryAfterAdminApproval
                                        ? const Icon(
                                            Icons.person_add_alt_outlined,
                                            color: Colors.redAccent)
                                        : const Icon(
                                            Icons.person_add_disabled_outlined,
                                            color: Colors.greenAccent)
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
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic),
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
            ));

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_card.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class EventCard extends StatelessWidget {
  const EventCard(
    this.event, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  final EventPreview event;

  final void Function()? onTap;

  @override
  Widget build(BuildContext _context) => _eventCard(
        _context,
        event,
        onTap: onTap,
      );
}

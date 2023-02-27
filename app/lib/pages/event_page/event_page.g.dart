// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class EventPage extends HookConsumerWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _eventPage(
        _context,
        _ref,
      );
}

class _User extends HookConsumerWidget {
  const _User({
    Key? key,
    required this.user,
    required this.isCreator,
    required this.event,
  }) : super(key: key);

  final User user;

  final bool isCreator;

  final Event event;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __user(
        _context,
        _ref,
        user: user,
        isCreator: isCreator,
        event: event,
      );
}

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
    this.isUser = false,
    this.isCreator = false,
    this.iAmCreator = false,
    this.isWaiting = false,
    required this.event,
  }) : super(key: key);

  final User user;

  final bool isUser;

  final bool isCreator;

  final bool iAmCreator;

  final bool isWaiting;

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
        isUser: isUser,
        isCreator: isCreator,
        iAmCreator: iAmCreator,
        isWaiting: isWaiting,
        event: event,
      );
}

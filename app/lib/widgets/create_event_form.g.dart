// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_form.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _AddTagButton extends HookConsumerWidget {
  const _AddTagButton(
    this.tags,
    this.addTag,
    this.deleteTag, {
    Key? key,
  }) : super(key: key);

  final List<Tag> tags;

  final void Function(Tag) addTag;

  final void Function(Tag) deleteTag;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __addTagButton(
        _context,
        _ref,
        tags,
        addTag,
        deleteTag,
      );
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get idCreator => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get unreadMessages => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get entryAfterAdminApproval => throw _privateConstructorUsedError;
  List<User> get usersWhoWantToJoin => throw _privateConstructorUsedError;
  List<EventUser> get users => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String idCreator,
      String name,
      int? unreadMessages,
      String? imageUrl,
      String? description,
      DateTime? date,
      bool entryAfterAdminApproval,
      List<User> usersWhoWantToJoin,
      List<EventUser> users,
      List<Tag> tags});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idCreator = null,
    Object? name = null,
    Object? unreadMessages = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? entryAfterAdminApproval = null,
    Object? usersWhoWantToJoin = null,
    Object? users = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idCreator: null == idCreator
          ? _value.idCreator
          : idCreator // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entryAfterAdminApproval: null == entryAfterAdminApproval
          ? _value.entryAfterAdminApproval
          : entryAfterAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      usersWhoWantToJoin: null == usersWhoWantToJoin
          ? _value.usersWhoWantToJoin
          : usersWhoWantToJoin // ignore: cast_nullable_to_non_nullable
              as List<User>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EventUser>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String idCreator,
      String name,
      int? unreadMessages,
      String? imageUrl,
      String? description,
      DateTime? date,
      bool entryAfterAdminApproval,
      List<User> usersWhoWantToJoin,
      List<EventUser> users,
      List<Tag> tags});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idCreator = null,
    Object? name = null,
    Object? unreadMessages = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? entryAfterAdminApproval = null,
    Object? usersWhoWantToJoin = null,
    Object? users = null,
    Object? tags = null,
  }) {
    return _then(_$_Event(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idCreator: null == idCreator
          ? _value.idCreator
          : idCreator // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entryAfterAdminApproval: null == entryAfterAdminApproval
          ? _value.entryAfterAdminApproval
          : entryAfterAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      usersWhoWantToJoin: null == usersWhoWantToJoin
          ? _value._usersWhoWantToJoin
          : usersWhoWantToJoin // ignore: cast_nullable_to_non_nullable
              as List<User>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EventUser>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {@JsonKey(name: '_id') required this.id,
      required this.idCreator,
      required this.name,
      required this.unreadMessages,
      required this.imageUrl,
      required this.description,
      required this.date,
      required this.entryAfterAdminApproval,
      required final List<User> usersWhoWantToJoin,
      required final List<EventUser> users,
      required final List<Tag> tags})
      : _usersWhoWantToJoin = usersWhoWantToJoin,
        _users = users,
        _tags = tags;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String idCreator;
  @override
  final String name;
  @override
  final int? unreadMessages;
  @override
  final String? imageUrl;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final bool entryAfterAdminApproval;
  final List<User> _usersWhoWantToJoin;
  @override
  List<User> get usersWhoWantToJoin {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersWhoWantToJoin);
  }

  final List<EventUser> _users;
  @override
  List<EventUser> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Event(id: $id, idCreator: $idCreator, name: $name, unreadMessages: $unreadMessages, imageUrl: $imageUrl, description: $description, date: $date, entryAfterAdminApproval: $entryAfterAdminApproval, usersWhoWantToJoin: $usersWhoWantToJoin, users: $users, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idCreator, idCreator) ||
                other.idCreator == idCreator) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unreadMessages, unreadMessages) ||
                other.unreadMessages == unreadMessages) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(
                    other.entryAfterAdminApproval, entryAfterAdminApproval) ||
                other.entryAfterAdminApproval == entryAfterAdminApproval) &&
            const DeepCollectionEquality()
                .equals(other._usersWhoWantToJoin, _usersWhoWantToJoin) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idCreator,
      name,
      unreadMessages,
      imageUrl,
      description,
      date,
      entryAfterAdminApproval,
      const DeepCollectionEquality().hash(_usersWhoWantToJoin),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {@JsonKey(name: '_id') required final String id,
      required final String idCreator,
      required final String name,
      required final int? unreadMessages,
      required final String? imageUrl,
      required final String? description,
      required final DateTime? date,
      required final bool entryAfterAdminApproval,
      required final List<User> usersWhoWantToJoin,
      required final List<EventUser> users,
      required final List<Tag> tags}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get idCreator;
  @override
  String get name;
  @override
  int? get unreadMessages;
  @override
  String? get imageUrl;
  @override
  String? get description;
  @override
  DateTime? get date;
  @override
  bool get entryAfterAdminApproval;
  @override
  List<User> get usersWhoWantToJoin;
  @override
  List<EventUser> get users;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}

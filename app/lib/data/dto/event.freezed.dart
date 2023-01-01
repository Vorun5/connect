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
  int get id => throw _privateConstructorUsedError;
  int get idCreator => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get appearInSearch => throw _privateConstructorUsedError;
  bool get showAllMessage => throw _privateConstructorUsedError;
  bool get entryAfterAdminApproval => throw _privateConstructorUsedError;
  List<int> get idPinnedMessages => throw _privateConstructorUsedError;
  List<int> get usersWhoWantToJoin => throw _privateConstructorUsedError;
  List<EventUser> get users => throw _privateConstructorUsedError;
  List<int> get teams => throw _privateConstructorUsedError;
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
      {@JsonKey(name: '_id') int id,
      int idCreator,
      String name,
      String? description,
      DateTime? date,
      bool appearInSearch,
      bool showAllMessage,
      bool entryAfterAdminApproval,
      List<int> idPinnedMessages,
      List<int> usersWhoWantToJoin,
      List<EventUser> users,
      List<int> teams,
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
    Object? description = freezed,
    Object? date = freezed,
    Object? appearInSearch = null,
    Object? showAllMessage = null,
    Object? entryAfterAdminApproval = null,
    Object? idPinnedMessages = null,
    Object? usersWhoWantToJoin = null,
    Object? users = null,
    Object? teams = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idCreator: null == idCreator
          ? _value.idCreator
          : idCreator // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appearInSearch: null == appearInSearch
          ? _value.appearInSearch
          : appearInSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllMessage: null == showAllMessage
          ? _value.showAllMessage
          : showAllMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      entryAfterAdminApproval: null == entryAfterAdminApproval
          ? _value.entryAfterAdminApproval
          : entryAfterAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      idPinnedMessages: null == idPinnedMessages
          ? _value.idPinnedMessages
          : idPinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<int>,
      usersWhoWantToJoin: null == usersWhoWantToJoin
          ? _value.usersWhoWantToJoin
          : usersWhoWantToJoin // ignore: cast_nullable_to_non_nullable
              as List<int>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EventUser>,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      {@JsonKey(name: '_id') int id,
      int idCreator,
      String name,
      String? description,
      DateTime? date,
      bool appearInSearch,
      bool showAllMessage,
      bool entryAfterAdminApproval,
      List<int> idPinnedMessages,
      List<int> usersWhoWantToJoin,
      List<EventUser> users,
      List<int> teams,
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
    Object? description = freezed,
    Object? date = freezed,
    Object? appearInSearch = null,
    Object? showAllMessage = null,
    Object? entryAfterAdminApproval = null,
    Object? idPinnedMessages = null,
    Object? usersWhoWantToJoin = null,
    Object? users = null,
    Object? teams = null,
    Object? tags = null,
  }) {
    return _then(_$_Event(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idCreator: null == idCreator
          ? _value.idCreator
          : idCreator // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appearInSearch: null == appearInSearch
          ? _value.appearInSearch
          : appearInSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllMessage: null == showAllMessage
          ? _value.showAllMessage
          : showAllMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      entryAfterAdminApproval: null == entryAfterAdminApproval
          ? _value.entryAfterAdminApproval
          : entryAfterAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      idPinnedMessages: null == idPinnedMessages
          ? _value._idPinnedMessages
          : idPinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<int>,
      usersWhoWantToJoin: null == usersWhoWantToJoin
          ? _value._usersWhoWantToJoin
          : usersWhoWantToJoin // ignore: cast_nullable_to_non_nullable
              as List<int>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<EventUser>,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      required this.description,
      required this.date,
      required this.appearInSearch,
      required this.showAllMessage,
      required this.entryAfterAdminApproval,
      required final List<int> idPinnedMessages,
      required final List<int> usersWhoWantToJoin,
      required final List<EventUser> users,
      required final List<int> teams,
      required final List<Tag> tags})
      : _idPinnedMessages = idPinnedMessages,
        _usersWhoWantToJoin = usersWhoWantToJoin,
        _users = users,
        _teams = teams,
        _tags = tags;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey(name: '_id')
  final int id;
  @override
  final int idCreator;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final bool appearInSearch;
  @override
  final bool showAllMessage;
  @override
  final bool entryAfterAdminApproval;
  final List<int> _idPinnedMessages;
  @override
  List<int> get idPinnedMessages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idPinnedMessages);
  }

  final List<int> _usersWhoWantToJoin;
  @override
  List<int> get usersWhoWantToJoin {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersWhoWantToJoin);
  }

  final List<EventUser> _users;
  @override
  List<EventUser> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<int> _teams;
  @override
  List<int> get teams {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Event(id: $id, idCreator: $idCreator, name: $name, description: $description, date: $date, appearInSearch: $appearInSearch, showAllMessage: $showAllMessage, entryAfterAdminApproval: $entryAfterAdminApproval, idPinnedMessages: $idPinnedMessages, usersWhoWantToJoin: $usersWhoWantToJoin, users: $users, teams: $teams, tags: $tags)';
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
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.appearInSearch, appearInSearch) ||
                other.appearInSearch == appearInSearch) &&
            (identical(other.showAllMessage, showAllMessage) ||
                other.showAllMessage == showAllMessage) &&
            (identical(
                    other.entryAfterAdminApproval, entryAfterAdminApproval) ||
                other.entryAfterAdminApproval == entryAfterAdminApproval) &&
            const DeepCollectionEquality()
                .equals(other._idPinnedMessages, _idPinnedMessages) &&
            const DeepCollectionEquality()
                .equals(other._usersWhoWantToJoin, _usersWhoWantToJoin) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idCreator,
      name,
      description,
      date,
      appearInSearch,
      showAllMessage,
      entryAfterAdminApproval,
      const DeepCollectionEquality().hash(_idPinnedMessages),
      const DeepCollectionEquality().hash(_usersWhoWantToJoin),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_teams),
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
      {@JsonKey(name: '_id') required final int id,
      required final int idCreator,
      required final String name,
      required final String? description,
      required final DateTime? date,
      required final bool appearInSearch,
      required final bool showAllMessage,
      required final bool entryAfterAdminApproval,
      required final List<int> idPinnedMessages,
      required final List<int> usersWhoWantToJoin,
      required final List<EventUser> users,
      required final List<int> teams,
      required final List<Tag> tags}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: '_id')
  int get id;
  @override
  int get idCreator;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime? get date;
  @override
  bool get appearInSearch;
  @override
  bool get showAllMessage;
  @override
  bool get entryAfterAdminApproval;
  @override
  List<int> get idPinnedMessages;
  @override
  List<int> get usersWhoWantToJoin;
  @override
  List<EventUser> get users;
  @override
  List<int> get teams;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
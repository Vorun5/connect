import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO(Vorun5): избавиться от этого провайдера и просто передавать username
// в userProfileProvider
final selectedUserProfileProvider = StateProvider<String?>((_) => null);

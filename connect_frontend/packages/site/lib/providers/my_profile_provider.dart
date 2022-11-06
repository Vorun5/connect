import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/data/api/api_services.dart';
import 'package:site/data/dto/user.dart';

final myProfileProvider =
    FutureProvider<User?>((_) async => ApiServices.getMe());

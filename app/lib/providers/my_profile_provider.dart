import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/user.dart';

final myProfileProvider =
    FutureProvider<User?>((_) async => ApiServices.getMe());

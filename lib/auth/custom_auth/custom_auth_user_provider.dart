import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class FACConsigAuthUser {
  FACConsigAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<FACConsigAuthUser> fACConsigAuthUserSubject =
    BehaviorSubject.seeded(FACConsigAuthUser(loggedIn: false));
Stream<FACConsigAuthUser> fACConsigAuthUserStream() => fACConsigAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);

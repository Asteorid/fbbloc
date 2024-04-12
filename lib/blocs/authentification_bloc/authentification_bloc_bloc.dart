import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'authentification_bloc_event.dart';
part 'authentification_bloc_state.dart';

class AuthentificationBlocBloc
    extends Bloc<AuthentificationBlocEvent, AuthentificationBlocState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthentificationBlocBloc({required this.userRepository})
      : super(const AuthentificationBlocState.unknown()) {
    _userSubscription = userRepository.user.listen((user) {
      add(AuthentificationUserChanged(user));
    });
    on<AuthentificationUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthentificationBlocState.authentificated(event.user!));
      } else {
        emit(const AuthentificationBlocState.unauthentificated());
      }
    });
  }
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

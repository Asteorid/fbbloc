part of 'authentification_bloc_bloc.dart';

sealed class AuthentificationBlocEvent extends Equatable {
  const AuthentificationBlocEvent();

  @override
  List<Object> get props => [];
}

class AuthentificationUserChanged extends AuthentificationBlocEvent {
  final User? user;

  const AuthentificationUserChanged(this.user);
}

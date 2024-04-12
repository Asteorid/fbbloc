part of 'authentification_bloc_bloc.dart';

enum AuthentificationStatus { authentificated, unauthentificated, unknown }

class AuthentificationBlocState extends Equatable {
  final AuthentificationStatus status;
  final User? user;

  const AuthentificationBlocState._(
      {this.status = AuthentificationStatus.unknown, this.user});

  const AuthentificationBlocState.unknown() : this._();

  const AuthentificationBlocState.authentificated(User user)
      : this._(status: AuthentificationStatus.authentificated, user: user);

  const AuthentificationBlocState.unauthentificated()
      : this._(status: AuthentificationStatus.unauthentificated);

  @override
  List<Object?> get props => [status, user];
}

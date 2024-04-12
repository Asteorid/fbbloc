part of 'sign_in_bloc_bloc.dart';

sealed class SignInBlocState extends Equatable {
  const SignInBlocState();

  @override
  List<Object> get props => [];
}

final class SignInBlocInitial extends SignInBlocState {}

class SignInSuccess extends SignInBlocState {}

class SignInFailure extends SignInBlocState {
  final String? message;

  const SignInFailure({this.message});
}

class SignInProcess extends SignInBlocState {}

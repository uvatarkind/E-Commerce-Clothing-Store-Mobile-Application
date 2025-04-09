part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {
  final MyUser? user;

  const AuthenticationUserChanged(this.user);
}

class LogoutRequested extends AuthenticationEvent {
  const LogoutRequested();
}

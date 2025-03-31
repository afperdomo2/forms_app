part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, submitting }

class RegisterState extends Equatable {
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

  const RegisterState(this.formStatus, this.username, this.email, this.password);

  RegisterState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) {
    return RegisterState(
      formStatus ?? this.formStatus,
      username ?? this.username,
      email ?? this.email,
      password ?? this.password,
    );
  }

  @override
  List<Object> get props => [formStatus, username, email, password];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(FormStatus.invalid, '', '', '');
}

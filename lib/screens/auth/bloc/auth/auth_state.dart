import 'package:mynotes/data/enums/form_status.dart';

class AuthState {
  final FormStatus formStatus;
  final String errorText;
  final String statusMessage;

  const AuthState({
    required this.formStatus,
    required this.errorText,
    required this.statusMessage,
  });

  AuthState copyWith({
    FormStatus? formStatus,
    String? errorText,
    String? statusMessage,
  }) {
    return AuthState(
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  factory AuthState.initial() {
    return const AuthState(
      formStatus: FormStatus.pure,
      errorText: "",
      statusMessage: "",
    );
  }
}

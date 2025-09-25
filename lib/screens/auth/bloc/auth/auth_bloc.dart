import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/model/sqflite_response.dart';
import 'package:mynotes/screens/auth/bloc/auth/auth_event.dart';
import 'package:mynotes/screens/auth/bloc/auth/auth_state.dart';
import 'package:mynotes/screens/auth/data/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<AuthSignWithGoogleEvent>(_signWithGoogle);
  }

  final AuthRepo _authRepo = AuthRepo();

  Future<void> _signWithGoogle(AuthSignWithGoogleEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await _authRepo.signWithGoogle();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/bloc/notes/notes_state.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/local/local_data_base.dart';
import 'package:mynotes/data/model/sqflite_response.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(this._localDatabase) : super(NotesState.initial()) {
    on<NotesFetchEvent>(_fetchNotes);
  }

  Future<void> _fetchNotes(NotesFetchEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse = await _localDatabase.getAllNotes();

    if (sqfliteResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          allNotes: sqfliteResponse.data,
          currentNotes: sqfliteResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: sqfliteResponse.errorText,
        ),
      );
    }
  }

  final LocalDatabase _localDatabase;
}

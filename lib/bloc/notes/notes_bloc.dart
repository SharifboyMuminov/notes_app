import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/bloc/notes/notes_state.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/local/local_data_base.dart';
import 'package:mynotes/data/model/sqflite_response.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(this._localDatabase) : super(NotesState.initial()) {
    on<NotesFetchEvent>(_fetchNotes);
    on<NotesAddEvent>(_addNotes);
    on<NotesUpdateEvent>(_updateNotes);
    on<NotesSearchEvent>(_searchNotes);
    on<NotesDeleteEvent>(_deleteNotes);
  }

  final LocalDatabase _localDatabase;

  Future<void> _fetchNotes(NotesFetchEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse = await _localDatabase.getAllNotes();

    if (sqfliteResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          allNotes: sqfliteResponse.data,
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

  Future<void> _addNotes(NotesAddEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse =
        await _localDatabase.insertNotes(event.notesModel);

    if (sqfliteResponse.errorText.isEmpty) {
      add(NotesFetchEvent());
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: sqfliteResponse.errorText,
        ),
      );
    }
  }

  Future<void> _updateNotes(NotesUpdateEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse = await _localDatabase.updateNotes(
      noteModel: event.notesModel,
    );

    if (sqfliteResponse.errorText.isEmpty) {
      add(NotesFetchEvent());
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: sqfliteResponse.errorText,
        ),
      );
    }
  }

  Future<void> _searchNotes(
      NotesSearchEvent notesSearchEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    if (notesSearchEvent.title.isNotEmpty) {
      SqfliteResponse sqfliteResponse =
          await _localDatabase.searchNotes(notesSearchEvent.title);

      if (sqfliteResponse.errorText.isEmpty) {
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            allNotes: sqfliteResponse.data,
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
    } else {
      add(NotesFetchEvent());
    }
  }

  Future<void> _deleteNotes(NotesDeleteEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse =
        await _localDatabase.deleteNotes(event.notesModels);

    if (sqfliteResponse.errorText.isEmpty) {
      add(NotesFetchEvent());
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: sqfliteResponse.errorText,
        ),
      );
    }
  }
}

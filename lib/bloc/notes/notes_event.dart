import 'package:mynotes/data/model/notes_model.dart';

abstract class NotesEvent {}

class NotesFetchEvent extends NotesEvent {}

class NotesAddEvent extends NotesEvent {
  final NotesModel notesModel;

  NotesAddEvent({required this.notesModel});
}

class NotesUpdateEvent extends NotesEvent {
  final NotesModel notesModel;

  NotesUpdateEvent({required this.notesModel});
}

class NotesDeleteEvent extends NotesEvent {
  final List<NotesModel> notesModels;

  NotesDeleteEvent({required this.notesModels});
}

class NotesSearchEvent extends NotesEvent {
  final String title;

  NotesSearchEvent({required this.title});
}

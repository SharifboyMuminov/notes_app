import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/model/notes_model.dart';

class NotesState {
  final FormStatus formStatus;
  final String errorText;
  final String statusMessage;
  final List<NotesModel> currentNotes;
  final List<NotesModel> allNotes;

  const NotesState({
    required this.allNotes,
    required this.currentNotes,
    required this.formStatus,
    required this.errorText,
    required this.statusMessage,
  });

  NotesState copyWith({
    FormStatus? formStatus,
    String? errorText,
    String? statusMessage,
    List<NotesModel>? currentNotes,
    List<NotesModel>? allNotes,
  }) {
    return NotesState(
      allNotes: allNotes ?? this.allNotes,
      currentNotes: currentNotes ?? this.currentNotes,
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  factory NotesState.initial() {
    return const NotesState(
      allNotes: [],
      currentNotes: [],
      formStatus: FormStatus.pure,
      errorText: "",
      statusMessage: "",
    );
  }
}

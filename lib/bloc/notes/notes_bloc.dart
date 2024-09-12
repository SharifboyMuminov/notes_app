import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/bloc/notes/notes_state.dart';
import 'package:mynotes/data/local/local_data_base.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(this._localDatabase):super(NotesState());


  final LocalDatabase _localDatabase;
}

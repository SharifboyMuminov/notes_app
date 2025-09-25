import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/bloc/category/category_event.dart';
import 'package:mynotes/bloc/category/category_state.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/local/local_data_base.dart';
import 'package:mynotes/data/model/sqflite_response.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._localDatabase) : super(CategoryState.initial()) {
    on<FetchCategoryEvent>(_fetchCategory);
    on<DeleteCategoryEvent>(_deleteCategory);
    on<InsertCategoryEvent>(_insertCategory);
  }

  final LocalDatabase _localDatabase;

  Future<void> _fetchCategory(FetchCategoryEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse = await _localDatabase.fetchCategories();

    if (sqfliteResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          categories: sqfliteResponse.data,
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

  Future<void> _deleteCategory(DeleteCategoryEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse = await _localDatabase.deleteCategory(
      event.categoryId,
    );

    if (sqfliteResponse.errorText.isEmpty) {
      add(FetchCategoryEvent());
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: sqfliteResponse.errorText,
        ),
      );
    }
  }

  Future<void> _insertCategory(InsertCategoryEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    SqfliteResponse sqfliteResponse = await _localDatabase.insertCategory(
      event.categoryModel,
    );

    if (sqfliteResponse.errorText.isEmpty) {
      add(FetchCategoryEvent());
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

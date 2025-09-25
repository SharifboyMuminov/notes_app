import 'package:equatable/equatable.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/model/category_model.dart';

class CategoryState extends Equatable {
  final FormStatus formStatus;
  final String errorText;
  final String statusMessage;
  final List<CategoryModel> categories;

  const CategoryState({
    required this.categories,
    required this.formStatus,
    required this.errorText,
    required this.statusMessage,
  });

  CategoryState copyWith({
    FormStatus? formStatus,
    String? errorText,
    String? statusMessage,
    List<CategoryModel>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  factory CategoryState.initial() {
    return const CategoryState(
      categories: [],
      formStatus: FormStatus.pure,
      errorText: "",
      statusMessage: "",
    );
  }

  @override
  List<Object?> get props => [
        categories,
        formStatus,
        errorText,
        statusMessage,
      ];
}

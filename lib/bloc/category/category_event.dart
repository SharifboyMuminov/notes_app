import 'package:equatable/equatable.dart';
import 'package:mynotes/data/model/category_model.dart';

abstract class CategoryEvent extends Equatable {}

class FetchCategoryEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class DeleteCategoryEvent extends CategoryEvent {
  final int categoryId;

  DeleteCategoryEvent({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class InsertCategoryEvent extends CategoryEvent {
  final CategoryModel categoryModel;

  InsertCategoryEvent({required this.categoryModel});

  @override
  List<Object?> get props => [categoryModel];
}

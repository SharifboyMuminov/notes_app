import 'dart:ui';

import 'package:mynotes/data/model/notes_model.dart';

class CategoryModel {
  final int id;
  final String title;
  final Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json[NotesConstanse.id] as int? ?? 0,
      title: json[NotesConstanse.name] as String? ?? "",
      color: Color(
        int.parse(
          json[NotesConstanse.color] as String? ?? "0xFFFFFFFF",
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NotesConstanse.name: title,
      NotesConstanse.color: color.value.toString(),
    };
  }

  CategoryModel copyWith({
    int? id,
    String? title,
    Color? color,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }
}

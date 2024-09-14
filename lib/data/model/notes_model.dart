import 'package:flutter/material.dart';

class NotesModel {
  int? id;
  String title;
  String subTitle;
  String date;
  String createDate;
  Color color;
  bool isRemove;

  NotesModel({
    required this.date,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.createDate,
    this.isRemove = false,
    this.id,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    debugPrint(json[NotesConstanse.color].toString());
    return NotesModel(
      id: json[NotesConstanse.id] as int? ?? 0,
      title: json[NotesConstanse.name] as String? ?? "",
      subTitle: json[NotesConstanse.description] as String? ?? "",
      date: json[NotesConstanse.date] as String? ?? "",
      createDate: json[NotesConstanse.createDate] as String? ?? "",
      color: Color(
          int.parse(json[NotesConstanse.color] as String? ?? "0xFFFFFFFF")),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NotesConstanse.createDate: createDate,
      NotesConstanse.date: date,
      NotesConstanse.description: subTitle,
      NotesConstanse.name: title,
      NotesConstanse.color: color.value.toString(),
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      NotesConstanse.id: id,
      NotesConstanse.createDate: createDate,
      NotesConstanse.date: date,
      NotesConstanse.description: subTitle,
      NotesConstanse.name: title,
      NotesConstanse.color: color.value.toString(),
    };
  }

  static NotesModel defaultModel() {
    return NotesModel(
      date: "",
      title: "",
      subTitle: "",
      createDate: "",
      color: Colors.white10,
    );
  }

  NotesModel copyWith({
    String? date,
    String? title,
    int? id,
    String? createDate,
    String? subTitle,
    Color? color,
  }) {
    return NotesModel(
      color: color ?? this.color,
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      createDate: createDate ?? this.createDate,
    );
  }
}

class NotesConstanse {
  static const tableName = "note_table";
  static const name = "name";
  static const createDate = "create_date";
  static const description = "description";
  static const date = "date";
  static const id = "id";
  static const color = "color";
}

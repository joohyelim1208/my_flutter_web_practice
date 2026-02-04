import 'package:flutter/foundation.dart';

@immutable
class Todo {
  const Todo({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final bool isFavorite;

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    bool? isFavorite,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          isCompleted == other.isCompleted &&
          isFavorite == other.isFavorite);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode ^
      isFavorite.hashCode;

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, isCompleted: $isCompleted, isFavorite: $isFavorite}';
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'isCompleted': isCompleted,
    'isFavorite': isFavorite,
  };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String?,
    isCompleted: json['isCompleted'] as bool,
    isFavorite: json['isFavorite'] as bool,
  );
}

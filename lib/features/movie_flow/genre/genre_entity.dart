// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class GenreEntity {
  final int id;
  final String name;

  const GenreEntity({
    required this.id,
    required this.name,
  });

  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    return GenreEntity(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  String toString() => 'GenreEntity(id: $id, name: $name)';

  @override
  bool operator ==(covariant GenreEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

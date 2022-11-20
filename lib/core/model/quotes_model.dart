// To parse this JSON data, do
//
//     final quotesModel = quotesModelFromJson(jsonString);

import 'package:flutter/foundation.dart';

class QuotesModel {
  QuotesModel({
    this.id,
    this.content,
    this.author,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  String? id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  DateTime? dateAdded;
  DateTime? dateModified;
}

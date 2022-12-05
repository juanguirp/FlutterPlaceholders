import 'dart:convert';
import 'package:placeholders/models/photo.dart';

class PhotosResponse {
  PhotosResponse({
    required this.results,
  });

  List<Photo> results;

  factory PhotosResponse.toList(List<dynamic> list) => PhotosResponse(
      results: List<Photo>.from(list.map((x) => Photo.fromMap(x))));
}

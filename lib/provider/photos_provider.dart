import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placeholders/models/models.dart';

class PhotosProvider extends ChangeNotifier {
  final String _baseUrl = 'jsonplaceholder.typicode.com';

  List<Photo> photosResult = [];

  PhotosProvider() {
    getPhotos();
  }

  Future<String> _getJsonData(String segmentUrl) async {
    final url = Uri.https(_baseUrl, segmentUrl);
    final response = await http.get(url);

    if (response.statusCode != 200) {
      return 'Error en la peticion';
    }
    return response.body;
  }

  getPhotos() async {
    final jsonData = await _getJsonData('/photos');
    print('Verificando la respuesta de la api: $jsonData');
    final photosResponse = PhotosResponse.toList(json.decode(jsonData));
    photosResult = photosResponse.results;
    notifyListeners();
  }
}

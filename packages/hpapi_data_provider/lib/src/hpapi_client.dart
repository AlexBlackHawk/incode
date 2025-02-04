import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:hpapi_data_provider/hpapi_data_provider.dart";

class HPApiClient {
  HPApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<List<Character>> getCharacters() async {
    final charactersRequest = Uri.https("hp-api.onrender.com", "/api/characters");

    final charactersResponse = await _httpClient.get(charactersRequest);

    final charactersJson = jsonDecode(charactersResponse.body) as List;

    return charactersJson.map((character) {
      return Character.fromJson(character as Map<String, dynamic>);
    }).toList();
  }
}
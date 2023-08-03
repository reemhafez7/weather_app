import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/datasources/settings.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

class ApiController {
  final http.Client client;
  ApiController(this.client);


  Future<PokemonResponseModel> getPokemon(String? url) async {
    Uri uri = Uri.parse(url ?? Sittings.baseUrl);
    try {
      http.Response response = await client.get(
        uri,
        headers: {'Content-Type': 'application/json',},
      );
      if (response.statusCode == 200 || response.statusCode==400) {
        PokemonResponseModel jsonResponse =
            PokemonResponseModel.fromJson(json.decode(response.body));
        return jsonResponse;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }
  ///////////////////////////////////////////////

  Future<PokemonDetail> getPokemonName(String name) async {
    Uri uri = Uri.parse('${Sittings.baseUrl}/$name');
    try {
      http.Response response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode==400) {
        PokemonDetail modelResponse =
            PokemonDetail.fromJson(json.decode(response.body));
        return modelResponse;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }
}

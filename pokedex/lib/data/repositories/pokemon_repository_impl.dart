//import 'package:pokedex/data/datasources/local_datasource/sharedPrefController.dart';
import 'package:pokedex/data/datasources/remote_datasource/apiController.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/domain/entities/pokemon_response_entity.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

import '../datasources/pref/sharedPrefController.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final SharedPrefController localDatasource;
  final ApiController dataSource;
  const PokemonRepositoryImpl({required this.dataSource, required this.localDatasource,});

  @override
  Future<PokemonDetailEntity> getPokemonByName(String name) async {
    try {
      PokemonDetail pokemonModel = await dataSource.getPokemonName(name);
      return pokemonModel.convertToEntity();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<PokemonResponseEntity> getPokemons(String? url) async {
    try {
      PokemonResponseModel responseModel = await dataSource.getPokemon(url);
      return PokemonResponseEntity(
        next: responseModel.next,
        pokemons: responseModel.pokemonModels
            .map((p) => PokemonEntity(name: p.name, url: p.url))
            .toList(),
      );
    } catch (e) {
      throw Exception();
    }
  }

  @override
  bool checkIfFavourite(String id) {
    return localDatasource.checkIfFavourite(id);
  }

  @override
  List<String> fetchFavourites() {
    return localDatasource.fetchFavouritesList();
  }

  @override
  Future<bool> saveToFavouritesList(String id) {
    return localDatasource.saveToFavourites(id);
  }

  @override
  Future<bool> removeFromFavourites(String id) {
    return localDatasource.removeFromFavourites(id);
  }
}

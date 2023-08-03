//import 'package:pokedex/data/datasources/local_datasource/sharedPrefController.dart';
import 'package:pokedex/data/datasources/remote_datasource/apiController.dart';
import 'package:pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/check_if_favourite.dart';
import 'package:pokedex/domain/usecases/get_favourite_list.dart';
import 'package:pokedex/domain/usecases/get_pokemon_by_name.dart';
import 'package:pokedex/domain/usecases/get_pokemons.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/usecases/remove_from_favourites.dart';
import 'package:pokedex/domain/usecases/save_to_favourites.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/datasources/pref/sharedPrefController.dart';
class Injector {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static ApiController remoteDataSource = ApiController(http.Client());
  static SharedPrefController localDatasource = SharedPrefController(sharedPreferences);
  static PokemonRepository pokemonRepository = PokemonRepositoryImpl(
      localDatasource: localDatasource, dataSource: remoteDataSource);
  static GetPokemons getPokemonsUsecase = GetPokemons(pokemonRepository);
  static GetPokemonByName getPokemonByNameUsecase =
      GetPokemonByName(pokemonRepository);
  static CheckIfFavourite checkIfFavouriteUsecase =
      CheckIfFavourite(pokemonRepository);
  static SaveToFavourites saveToFavouritesUsecase =
      SaveToFavourites(pokemonRepository);
  static GetFavouriteList getFavouriteListUsecase =
      GetFavouriteList(pokemonRepository);
  static RemoveFromFavourites removeFromFavouritesUseCase =
      RemoveFromFavourites(pokemonRepository);
}

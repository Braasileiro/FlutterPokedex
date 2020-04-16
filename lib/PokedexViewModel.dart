import 'network/PokeApi.dart';

import 'package:flutterpokedex/model/Pokemon.dart';

class PokedexViewModel {
  final _api = PokeApi();

  List<Pokemon> pokemons;

  void getAll(Function onLoaded) {
    _api.getAll().then((r) {
      pokemons = r;

      onLoaded();
    }).catchError((e) {
      print(e);
    });
  }
}

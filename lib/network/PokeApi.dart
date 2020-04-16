import 'package:dio/dio.dart';

import 'package:flutterpokedex/model/Pokemon.dart';

var dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/", connectTimeout: 10000));

class PokeApi {

  Future<List<Pokemon>> getAll() async {
    List<Pokemon> pokemons = List();

    Response response;
    Response responses = await dio.get("pokemon/?offset=0&limit=50");

    for (var result in responses.data['results']) {
      response = await dio.get('', options: RequestOptions(baseUrl: result['url']));

      pokemons.add(Pokemon.fromJson(response.data));
    }

    return pokemons;
  }
}

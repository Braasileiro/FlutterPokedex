import 'package:flutter/material.dart';

import 'package:flutterpokedex/PokedexViewModel.dart';
import 'package:flutterpokedex/extension/StringExtensions.dart';

final mViewModel = PokedexViewModel();

void main() {
  mViewModel.getAll(() => [runApp(Main())]);
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokedex',
      theme: ThemeData(primarySwatch: Colors.green),
      home: FlutterPokedex(title: 'Flutter Pokedex'),
    );
  }
}

class FlutterPokedex extends StatelessWidget {
  final String title;

  FlutterPokedex({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Card> pokemons = mViewModel.pokemons
        .map((pokemon) => Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0)),
            child: ListTile(
                leading: Image.network(pokemon.imageUrl),
                title: Text(pokemon.name.capitalize()))))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(children: pokemons));
  }
}

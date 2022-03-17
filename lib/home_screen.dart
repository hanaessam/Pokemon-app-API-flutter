import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon_api.dart';
import 'package:pokemon_app/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late PokemonApi _pokemonApi;
  late StreamController _streamController;
  late Stream _stream;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
    _pokemonApi = PokemonApi();
    getPokemons();
  }

  getPokemons() async {
    var response = await _pokemonApi.getPokemons();
    _streamController.add(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Poke App'),
        ),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                var myData = snapshot.data as Map;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    childAspectRatio: 1 / 1,
                  ),
                  itemCount: myData['pokemon'].length,
                  itemBuilder: (context, i) =>
                      PokeCard(i, myData['pokemon'][i]),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

/*
  ListView.builder(
  itemCount: myData['pokemon'].length,
  itemBuilder: (context, i) => PokeCard(i, myData['pokemon'][i]),
  );
} else {
return const CircularProgressIndicator();
}*/

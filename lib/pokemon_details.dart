import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final int index;
  final dynamic data;
  late Pokemon _pokemon;

  PokemonDetails(this.index, this.data, {Key? key}) : super(key: key) {
    _pokemon = Pokemon(data['num'], data['name'], data['img'], data['type'],
        data['height'], data['weight'], data['weaknesses']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(_pokemon.name),
        elevation: 0.0,
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(2, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(_pokemon.img),
                  ),
                  Column(
                    children: [
                      Text(
                        _pokemon.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

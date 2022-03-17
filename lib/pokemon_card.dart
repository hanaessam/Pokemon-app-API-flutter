import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';
import 'package:pokemon_app/pokemon_details.dart';

class PokeCard extends StatefulWidget {
  final int index;
  final dynamic data;
  late SmallPokemon _pokemon;
  PokeCard(this.index, this.data, {Key? key}) : super(key: key) {
    _pokemon = SmallPokemon(data['name'], data['img']);
  }

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Image(image: NetworkImage(widget._pokemon.img)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              widget._pokemon.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PokemonDetails(widget.index, widget.data),
                  ),
                );
              });
            },
            child: Text(
              '(Details)',
              style: TextStyle(
                color: Colors.cyan.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

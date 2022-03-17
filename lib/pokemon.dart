class Pokemon {
  final String? _num;
  final String? _name;
  final String? _img;
  final List _type;
  final String? _height;
  final String? _weight;
  final List _weaknesses;

  Pokemon(this._num, this._name, this._img, this._type, this._height,
      this._weight, this._weaknesses);

  get num => _num;

  get name => _name;

  get img => _img;

  get type => _type;

  get height => _height;

  get weight => _weight;

  get weaknesses => _weaknesses;
}

class SmallPokemon {
  final String _name;
  final String _img;

  SmallPokemon(this._name, this._img);

  get name => _name;
  get img => _img;
}

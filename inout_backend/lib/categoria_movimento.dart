class CategoriaMovimento {

  // variabili
  final String _nome;
  
  // costruttore
  CategoriaMovimento(this._nome){
    if(_nome.isEmpty) {
      throw ArgumentError('Category name cannot be empty');
    }
  }

  // metodi (getters)
  String getNome(){
    return _nome;
  }

// override di "==" in modo che due categorie con lo stesso nome risultino uguali
@override
bool operator ==(Object other) {
  return other is CategoriaMovimento &&
         _nome == other._nome;
}

@override
int get hashCode => _nome.hashCode;

}
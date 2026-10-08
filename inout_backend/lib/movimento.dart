import 'package:inout_backend/categoria_movimento.dart';
import 'package:inout_backend/enum_periodicita_movimento.dart';
import 'package:inout_backend/enum_tipo_movimento.dart';

class Movimento {

  // variabili
  final String _nome;
  final double _importo;
  final String _descrizione;
  final DateTime _orario;
  final TipoMovimento _tipo;
  final PeriodicitaMovimento _periodicita;
  final CategoriaMovimento _categoria;

  // costruttore
  Movimento(this._categoria, this._descrizione, 
            this._importo, this._nome, this._periodicita, this._tipo)
            
  /* initializer list */ : _orario = DateTime.now() {
    
    // controlli (è necessario controllare solo nome e importo 
    // dato che i controlli degli altri campi vengono controllati al di fuori di questa classe, e la descrizione può essere vuota)
    if(_nome.isEmpty) throw ArgumentError('Name cannot be empty');
    if(_importo <= 0) throw ArgumentError('Import cannot be zero or less than zero');
  }


  // getters
  String get nome => _nome;
  double get importo => _importo;
  String get descrizione => _descrizione;
  DateTime get orario => _orario;
  TipoMovimento get tipo => _tipo;
  PeriodicitaMovimento get periodicita => _periodicita;
  CategoriaMovimento get categoria => _categoria;


  // modifica campi: da fare in futuro

  // toString
  @override
  String toString(){
    return '$_nome\t$_importo\t${_descrizione.isEmpty? 'no descrizione' : _descrizione}\t$_orario\t$_tipo\t$_periodicita\t${_categoria.getNome()}';
  }

}
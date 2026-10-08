import 'package:inout_backend/categoria_movimento.dart';

import 'enum_tipo_movimento.dart';

import 'movimento.dart';

class PortafoglioGiornata {
  final List<Movimento> _movimenti;
  final DateTime _data;

  PortafoglioGiornata(DateTime data)
    : _movimenti = <Movimento>[],
      _data = DateTime(data.year, data.month, data.day);
  //la data farà anche da ID

  //getters
  List<Movimento> get movimenti => _movimenti;
  DateTime get data => _data;

  // metodi
  void aggiungiMovimento(Movimento movimento) {
    _movimenti.add(movimento);
  }

  void rimuoviMovimento(String nome, DateTime orario) {
    bool trovato = false;

    for (int i = 0; i < _movimenti.length && !trovato; i++) {
      if (_movimenti[i].nome == nome && _movimenti[i].orario == orario) {
        _movimenti.removeAt(i);
        trovato = true;
      }
    }
  }

  double getTotaleEntrate() {
    double totale = 0;

    for (int i = 0; i < _movimenti.length; i++) {
      if (_movimenti[i].tipo == TipoMovimento.entrata) {
        totale += _movimenti[i].importo;
      }
    }

    return totale;
  }

  double getTotaleUscite() {
    double totale = 0;

    for (int i = 0; i < _movimenti.length; i++) {
      if (_movimenti[i].tipo == TipoMovimento.uscita) {
        totale += _movimenti[i].importo;
      }
    }

    return totale;
  }

  double getSaldo() {
    return getTotaleEntrate() - getTotaleUscite();
  }

  List<Movimento> getMovimentiCategoria(CategoriaMovimento categoria) {
    List<Movimento> result = <Movimento>[];

    for (int i = 0; i < _movimenti.length; i++) {
      if (movimenti[i].categoria == categoria) {
        result.add(movimenti[i]);
      }
    }

    return result;
  }
}

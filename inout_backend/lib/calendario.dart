import 'package:inout_backend/portafoglio_giornata.dart';

class Calendario {
  // il calendario raccoglie i vari PortafoglioGiornata tramite una mappa data-PortafoglioGrionata
  final Map<DateTime, PortafoglioGiornata> _giornate = {};

  // getters
  Map<DateTime, PortafoglioGiornata> get giornate => _giornate;

  // metodi
  void inserisciPortafoglioGiornata(DateTime data) {
    DateTime dataNormalizzata = DateTime(data.year, data.month, data.day);

    if (!_giornate.containsKey(dataNormalizzata)) {
      _giornate[dataNormalizzata] = PortafoglioGiornata(data);
    }
  }

  PortafoglioGiornata getPortafoglioGiornata(DateTime data) {
    DateTime dataNormalizzata = DateTime(data.year, data.month, data.day);
    if (_giornate[dataNormalizzata] == null) {
      inserisciPortafoglioGiornata(dataNormalizzata);
    }

    // non è possibile che questo campo sia null dato che l'ho appena creato, per questo inserisco "!"
    return _giornate[dataNormalizzata]!;
  }

  double getTotaleEntrateMese(int anno, int mese) {
    double totEntrate = 0;

    _giornate.forEach((data, portafoglio) {
      if (data.year == anno && data.month == mese) {
        totEntrate += portafoglio.getTotaleEntrate();
      }
    });

    return totEntrate;
  }

  double getTotaleUscite(int anno, int mese) {
    double totUscite = 0;

    _giornate.forEach((data, portafoglio) {
      if (data.year == anno && data.month == mese) {
        totUscite += portafoglio.getTotaleUscite();
      }
    });

    return totUscite;
  }

  double getSaldoMese(int anno, int mese) {
    return getTotaleEntrateMese(anno, mese) - getTotaleUscite(anno, mese);
  }
}

import 'package:inout_backend/portafoglio_giornata.dart';

class Calendario {
  // il calendario raccoglie i vari PortafoglioGiornata tramite una mappa data-PortafoglioGrionata
  final Map<DateTime, PortafoglioGiornata> _giornate = {};

  // getters
  Map<DateTime, PortafoglioGiornata> get giornate =>
      Map.unmodifiable(_giornate);

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

  // fuzioni che operano su base mensile
  double getTotaleEntrateMese(int anno, int mese) {
    double totEntrate = 0;

    _giornate.forEach((data, portafoglio) {
      if (data.year == anno && data.month == mese) {
        totEntrate += portafoglio.getTotaleEntrate();
      }
    });

    return totEntrate;
  }

  double getTotaleUsciteMese(int anno, int mese) {
    double totUscite = 0;

    _giornate.forEach((data, portafoglio) {
      if (data.year == anno && data.month == mese) {
        totUscite += portafoglio.getTotaleUscite();
      }
    });

    return totUscite;
  }

  double getSaldoMese(int anno, int mese) {
    return getTotaleEntrateMese(anno, mese) - getTotaleUsciteMese(anno, mese);
  }

  // funzioni che operano su base annuale
  double getTotaleEntrateAnno(int anno) {
    double totEntrate = 0;

    _giornate.forEach((data, portafoglio) {
      if (data.year == anno) {
        totEntrate += portafoglio.getTotaleEntrate();
      }
    });

    return totEntrate;
  }

  double getTotaleUsciteAnno(int anno) {
    double totUscite = 0;

    _giornate.forEach((data, portafoglio) {
      if (data.year == anno) {
        totUscite += portafoglio.getTotaleUscite();
      }
    });

    return totUscite;
  }

  double getSaldoAnno(int anno) {
    return getTotaleEntrateAnno(anno) - getTotaleUsciteAnno(anno);
  }

  // funzioni per la rimozione di PortafoglioGiornata
  void rimuoviPortafoglioGiornata(DateTime data) {
    _giornate.remove(DateTime(data.year, data.month, data.day));
  }
}

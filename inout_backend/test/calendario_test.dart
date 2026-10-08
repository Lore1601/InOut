import 'package:inout_backend/calendario.dart';
import 'package:test/test.dart'
    show expect, group, isEmpty, isFalse, isNotNull, isTrue, setUp, test;

void main() {
  late Calendario calendario;

  setUp(() {
    calendario = Calendario();
  });

  group('Gestione delle giornate', () {
    test('Inserimento di una giornata', () {
      final data = DateTime(2026, 10, 8);

      calendario.inserisciPortafoglioGiornata(data);

      expect(calendario.giornate.length, 1);
      expect(calendario.giornate.containsKey(data), isTrue);
    });

    test('Non inserisce due volte la stessa giornata', () {
      calendario.inserisciPortafoglioGiornata(DateTime(2026, 10, 8, 10));

      calendario.inserisciPortafoglioGiornata(DateTime(2026, 10, 8, 20));

      expect(calendario.giornate.length, 1);
    });

    test('Giornate diverse vengono salvate separatamente', () {
      calendario.inserisciPortafoglioGiornata(DateTime(2026, 10, 8));

      calendario.inserisciPortafoglioGiornata(DateTime(2026, 10, 9));

      expect(calendario.giornate.length, 2);
    });

    test('getPortafoglioGiornata crea una giornata inesistente', () {
      final portafoglio = calendario.getPortafoglioGiornata(
        DateTime(2026, 10, 8),
      );

      expect(portafoglio, isNotNull);
      expect(calendario.giornate.length, 1);
    });

    test('getPortafoglioGiornata restituisce lo stesso oggetto', () {
      final primo = calendario.getPortafoglioGiornata(
        DateTime(2026, 10, 8, 10),
      );

      final secondo = calendario.getPortafoglioGiornata(
        DateTime(2026, 10, 8, 18),
      );

      expect(identical(primo, secondo), isTrue);
    });

    test('Rimozione di una giornata', () {
      final data = DateTime(2026, 10, 8);

      calendario.inserisciPortafoglioGiornata(data);
      calendario.rimuoviPortafoglioGiornata(data);

      expect(calendario.giornate.containsKey(data), isFalse);
      expect(calendario.giornate, isEmpty);
    });
  });

  group('Calcoli mensili', () {
    test('Un mese senza movimenti ha entrate pari a zero', () {
      expect(calendario.getTotaleEntrateMese(2026, 10), 0);
    });

    test('Un mese senza movimenti ha uscite pari a zero', () {
      expect(calendario.getTotaleUsciteMese(2026, 10), 0);
    });

    test('Un mese senza movimenti ha saldo pari a zero', () {
      expect(calendario.getSaldoMese(2026, 10), 0);
    });

    test('Giornate vuote non modificano il saldo mensile', () {
      calendario.inserisciPortafoglioGiornata(DateTime(2026, 10, 8));

      calendario.inserisciPortafoglioGiornata(DateTime(2026, 10, 9));

      expect(calendario.getSaldoMese(2026, 10), 0);
    });
  });

  group('Calcoli annuali', () {
    test('Un anno senza movimenti ha entrate pari a zero', () {
      expect(calendario.getTotaleEntrateAnno(2026), 0);
    });

    test('Un anno senza movimenti ha uscite pari a zero', () {
      expect(calendario.getTotaleUsciteAnno(2026), 0);
    });

    test('Un anno senza movimenti ha saldo pari a zero', () {
      expect(calendario.getSaldoAnno(2026), 0);
    });

    test('Giornate vuote non modificano il saldo annuale', () {
      calendario.inserisciPortafoglioGiornata(DateTime(2026, 1, 10));

      calendario.inserisciPortafoglioGiornata(DateTime(2026, 12, 20));

      expect(calendario.getSaldoAnno(2026), 0);
    });
  });
}

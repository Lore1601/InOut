import 'package:inout_backend/categoria_movimento.dart';
import 'package:inout_backend/enum_periodicita_movimento.dart';
import 'package:inout_backend/enum_tipo_movimento.dart';
import 'package:inout_backend/movimento.dart';
import 'package:inout_backend/portafoglio_giornata.dart';

void main(List<String> arguments) {

  Movimento movimento1 = Movimento(CategoriaMovimento('affitto'), 'affitto della casa a sestola', 400, 'affittoGennaio', PeriodicitaMovimento.periodico, TipoMovimento.uscita);
  Movimento movimento2 = Movimento(CategoriaMovimento('stipendio'), 'stipendio mensile del mio lavoro da ingegnere', 3000, 'stipendio', PeriodicitaMovimento.periodico, TipoMovimento.entrata);
  Movimento movimento3 = Movimento(CategoriaMovimento('auto'), 'terza rata della macchina', 400, 'rataMacchina', PeriodicitaMovimento.periodico, TipoMovimento.uscita);

  PortafoglioGiornata portafoglioOggi = PortafoglioGiornata(DateTime.now());

  portafoglioOggi.aggiungiMovimento(movimento1);
  portafoglioOggi.aggiungiMovimento(movimento2);
  portafoglioOggi.aggiungiMovimento(movimento3);
  
  print (portafoglioOggi.movimenti.elementAt(0));
  print (portafoglioOggi.movimenti.elementAt(1));
  print (portafoglioOggi.movimenti.elementAt(2));

  print(portafoglioOggi.getTotaleEntrate());
  print(portafoglioOggi.getTotaleUscite());

  portafoglioOggi.rimuoviMovimento(movimento2.nome, movimento2.orario);

  print(portafoglioOggi.getTotaleEntrate());
  print(portafoglioOggi.getTotaleUscite());
  print(portafoglioOggi.getSaldo());

}

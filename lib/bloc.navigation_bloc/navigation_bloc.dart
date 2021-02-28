import 'package:bloc/bloc.dart';
import 'package:flutter_sidebar_animation_navigation/pages/enderecos_page.dart';
import 'package:flutter_sidebar_animation_navigation/pages/painel_page.dart';
import 'package:flutter_sidebar_animation_navigation/pages/pedidos_page.dart';
import 'package:flutter_sidebar_animation_navigation/pages/downloads_page.dart';
import 'package:flutter_sidebar_animation_navigation/pages/sua_conta_page.dart';

enum NavigationEvents {
  PainelPageClickedEvent,
  PedidosClickedEvent,
  DownloadsClickedEvent,
  EnderecosClickedEvent,
  SuaContaClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => PainelPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.PainelPageClickedEvent:
        yield PainelPage();
        break;
      case NavigationEvents.PedidosClickedEvent:
        yield PedidosPage();
        break;
      case NavigationEvents.DownloadsClickedEvent:
        yield DownloadsPage();
        break;
      case NavigationEvents.EnderecosClickedEvent:
        yield EnderecosPage();
        break;
      case NavigationEvents.SuaContaClickedEvent:
        yield SuaContaPage();
        break;
    }
  }
}

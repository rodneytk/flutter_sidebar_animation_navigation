import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sidebar_animation_navigation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_sidebar_animation_navigation/sidebar/sidebar_item.dart';
import 'package:flutter_sidebar_animation_navigation/sidebar/sidebar_menu_clipper.dart';
import 'package:flutter_sidebar_animation_navigation/theme.dart';
import 'package:rxdart/rxdart.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
  final _animationDuration = const Duration(milliseconds: 300);
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedStreamSink;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedStreamSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedStreamSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedStreamSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedStreamSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double switchButtonWidth = 40;
    final double switchButtonHeight = 100;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSidebarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSidebarOpenedAsync.data ? 0 : -screenWidth,
            right: isSidebarOpenedAsync.data
                ? 0
                : screenWidth - switchButtonWidth - 5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    color: sidebarBackgroundColor,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 67,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          title: Text(
                            'Nome do Cliente',
                            style: sidebarUserTitleTextStyle,
                          ),
                          subtitle: Text(
                            'email.do.cliente@localhost.com.br',
                            style: sidebarUserSubtitleTextStyle,
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.face,
                              size: 40,
                            ),
                            radius: 40,
                            backgroundColor: primaryColor,
                            foregroundColor: sidebarBackgroundColor,
                          ),
                        ),
                        Divider(
                          height: 32,
                          thickness: 0.5,
                          color: secondTextColor,
                          indent: 32,
                          endIndent: 32,
                        ),
                        SidebarItem(
                          icon: Icons.insert_chart,
                          title: 'Painel',
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.PainelPageClickedEvent);
                          },
                        ),
                        SidebarItem(
                          icon: Icons.shopping_bag,
                          title: 'Pedidos',
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.PedidosClickedEvent);
                          },
                        ),
                        SidebarItem(
                          icon: Icons.download_sharp,
                          title: 'Downloads',
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.DownloadsClickedEvent);
                          },
                        ),
                        SidebarItem(
                          icon: Icons.room,
                          title: 'Endereços',
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.EnderecosClickedEvent);
                          },
                        ),
                        SidebarItem(
                          icon: Icons.account_box,
                          title: 'Sua conta',
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.SuaContaClickedEvent);
                          },
                        ),
                        Divider(
                          height: 32,
                          thickness: 0.5,
                          color: secondTextColor,
                          indent: 32,
                          endIndent: 32,
                        ),
                        SidebarItem(
                          icon: Icons.settings,
                          title: 'Configurações',
                        ),
                        SidebarItem(
                          icon: Icons.exit_to_app,
                          title: 'Sair',
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: SidebarMenuClipper(),
                      child: Container(
                        width: switchButtonWidth,
                        height: switchButtonHeight,
                        color: sidebarBackgroundColor,
                        alignment: Alignment.center,
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _animationController.view,
                          color: primaryTextColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

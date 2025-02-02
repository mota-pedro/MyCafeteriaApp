import 'dart:ui';

import 'package:contador/FoodMenuPage.dart';
import 'package:flutter/material.dart';
import 'HomePageMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = HomePageMenu(onPageSelected: _setPage);
  }

  void _setPage(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white70),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                  height: 180,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      size: 45,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Início',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _setPage(HomePageMenu(onPageSelected: _setPage));
                    },
                  ),

                  SizedBox(height: 30),

                  ListTile(
                    leading: Icon(
                      Icons.food_bank,
                      size: 45,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Cardápio',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _setPage(FoodMenuPage());
                    },
                  ),

                  SizedBox(height: 30),

                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 45,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Configurações',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              children: [
                WidgetSpan(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(Icons.coffee)
                    )
                ),
                TextSpan(
                  text: 'MyCafeteria',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                )
              ]
          ),),
        backgroundColor: Color(0xFF402D26),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _currentPage,
    );
  }
}
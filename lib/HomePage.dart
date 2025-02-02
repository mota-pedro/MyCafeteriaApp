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
      drawer: Drawer(),
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
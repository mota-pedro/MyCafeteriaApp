import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _count = 0;

  void decrement() {
    setState(() {
      _count--;
    });
  }

  void increment() {
    setState(() {
      _count++;
    });
  }

  bool get isEmpty => _count == 0;

  bool get isFull => _count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_coffee.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                isFull ? 'Lotado' : 'Pode Entrar!',
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF402D26),
                )
            ),

            SizedBox(
              height: 14,
            ),

            Text(
              '$_count',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402D26),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Color(0x80402D26) : Color(0xFF402D26),
                    fixedSize: const Size(110, 70),
                  ),
                  child: Text(
                    'Sair',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Color(0x80402D26) : Color(0xFF402D26),
                    fixedSize: const Size(110, 70),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

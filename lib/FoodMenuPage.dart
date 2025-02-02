import 'package:flutter/material.dart';
import '';

class FoodMenuPage extends StatelessWidget {
  const FoodMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFc3996c),
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            
          ],
        ),
      );
  }

}
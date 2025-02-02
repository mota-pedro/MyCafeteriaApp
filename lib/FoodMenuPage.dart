import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'model/Coffee.dart';

class FoodMenuPage extends StatelessWidget {
  final List<Coffee> coffeeList = [
    Coffee(name: 'Cappuccino', value: 10.0, isHot: true),
    Coffee(name: 'Espresso', value: 7.50, isHot: true),
    Coffee(name: 'Latte', value: 10.0, isHot: true),
    Coffee(name: 'Iced Latte', value: 12.0, isHot: false),
    Coffee(name: 'Macchiato', value: 12.0, isHot: true),
    Coffee(name: 'Americano', value: 7.50, isHot: true),
    Coffee(name: 'Cold Brew', value: 8.0, isHot: false),
    Coffee(name: 'Frappe', value: 14.0, isHot: false)
  ];

  FoodMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Color(0xFFc3996c),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (Coffee coffee in coffeeList) Padding(
                        padding: EdgeInsets.all(20),
                        child: TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white24,
                              fixedSize: Size(350, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              )
                          ),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/cafe1.png'),
                                height: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coffee.getName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        'R\$ ${coffee.getValue.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        coffee.getIsHot ? MdiIcons.fire : MdiIcons.snowflake,
                                        color: Colors.black,
                                        size: 32,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ],
        )
    );
  }

}
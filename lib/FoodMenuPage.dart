import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'Singleton/table_manager.dart';
import 'entities/Coffee.dart';
import 'entities/CafeteriaTable.dart';
import 'Singleton/coffee_manager.dart';

class FoodMenuPage extends StatelessWidget {

  final TextEditingController tableController = TextEditingController();

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
                      for (Coffee coffee in CoffeeManager().getCoffeeList()) Padding(
                        padding: EdgeInsets.all(20),
                        child: TextButton(
                          onPressed: () => showTableSelection(context, coffee),
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

  void showTableSelection(BuildContext context, Coffee coffee) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            width: 500,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Escolha a mesa:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    Spacer(),
                    TextField(
                      controller: tableController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Número da mesa',
                        border: OutlineInputBorder()
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () => addToTable(coffee),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF402D26),
                          fixedSize: Size(100, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        child: Text(
                          'Adicionar',
                          style: TextStyle(color: Colors.white),
                        )
                    )
                  ],
                ),
            ),
          ),
        )
    );
  }

  void addToTable(Coffee coffee) {
    int selectedTableNumber = int.parse(tableController.text);
    for (CafeteriaTable table in TableManager().getTables()) {
      if (table.number == selectedTableNumber) {
        table.addOrder(coffee);
      }
    }
  }

}
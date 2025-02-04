import 'package:contador/entities/CafeteriaTable.dart';
import 'package:flutter/material.dart';
import 'Singleton/table_manager.dart';
import 'entities/Coffee.dart';

class TablesPage extends StatefulWidget {

  TablesPage({super.key});

  @override
  State<StatefulWidget> createState() => _TablesPageState();

}

class _TablesPageState extends State<TablesPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFFc3996c),
      child: GridView.count(
          crossAxisCount: 2,
          children: [
            for (CafeteriaTable table in TableManager().getTables()) Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                    onPressed: () => showTableOrders(context, table),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white24,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text(
                      'Mesa ${table.getNumber.toString()}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black
                      ),
                    ),
                ),
            )
          ]
      ),
    );
  }

  void showTableOrders(BuildContext context, CafeteriaTable table) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setDialogState) {
                return Dialog(
                  child: Container(
                    width: 500,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pedidos da mesa ${table.getNumber}:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                for (Coffee coffee in table.getOrders) Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setDialogState(() {
                                                table.removerOrder(coffee);
                                              });
                                              setState(() {});
                                            },
                                            style: IconButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                fixedSize: Size(16, 16)
                                            ),
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          coffee.getName,
                                          style: TextStyle(
                                              fontSize: 18
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'R\$ ${coffee.getValue.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
    );
  }

}

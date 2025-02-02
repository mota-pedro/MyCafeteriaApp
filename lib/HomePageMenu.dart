import 'package:flutter/material.dart';
import 'FoodMenuPage.dart';

class HomePageMenu extends StatelessWidget {

  final Function(Widget) onPageSelected;

  const HomePageMenu({super.key, required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFFC3996C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                onPageSelected(FoodMenuPage());
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white24,
                  fixedSize: const Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        'Cardápio',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white24,
                  fixedSize: const Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        'Mesas',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

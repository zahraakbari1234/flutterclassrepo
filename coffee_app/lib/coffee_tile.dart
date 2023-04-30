import 'package:flutter/material.dart';


class CoffeeTile extends StatelessWidget {

   CoffeeTile({required this.coffeeImagePath , required this.coffeeName , required this.CoffeePrice, required this.coffeeDiscription});

  final String coffeeImagePath;
  final String coffeeName;
  final String coffeeDiscription;
  final String CoffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(// outer space
      padding: const EdgeInsets.only(bottom: 10 , left: 10),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),//space between outer container line and inner components
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeeImagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName, style: TextStyle(
                    fontSize: 20
                  ),),
                  Text(coffeeDiscription , style: TextStyle(
                    color: Colors.grey.shade700,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$" + CoffeePrice),
                      Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.orange
                        ),
                        child: Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

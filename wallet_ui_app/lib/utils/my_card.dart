import 'package:flutter/material.dart';

class my_card extends StatelessWidget {
  final Color? color;
  final double balance;
  final int cartNumber;
  final int expireMonth;
  final int expireYear;

  my_card(
      {this.color,
      required this.balance,
      required this.cartNumber,
      required this.expireMonth,
      required this.expireYear});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(25),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Balance",
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "\$" + "$balance",
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$cartNumber",
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  "$expireYear/$expireMonth",
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

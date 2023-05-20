import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final String balance;
  final String Expense;
  final String Income;
  TopCard({required this.balance, required this.Expense, required this.Income});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Balance",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                "\$$balance",
                style: TextStyle(color: Colors.grey[800], fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[100]),
                          child: Center(
                              child: const Icon(
                            Icons.arrow_upward_outlined,
                            color: Colors.green,
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Income",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold)),
                            Text("\$$Income" , style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[100]),
                          child: Center(
                              child: Icon(
                                Icons.arrow_downward_outlined,
                                color: Colors.red,
                              ),),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [  Text("Expense",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold)),
                            Text("\$$Expense" , style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold
                            ),)],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4.0 ,4.0),
              blurRadius: 15,
              spreadRadius: 1
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0 ,-4.0),
                blurRadius: 15,
                spreadRadius: 1
            ),
          ],
        ),
      ),
    );
  }
}

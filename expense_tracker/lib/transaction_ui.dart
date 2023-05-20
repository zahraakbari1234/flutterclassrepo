import 'package:flutter/material.dart';

class TransactionUi extends StatelessWidget {
  final String transactionName;
  final String money;
  final String expenseOrIncome;

  TransactionUi({required this.transactionName , required this.money ,required this.expenseOrIncome});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        color: Colors.grey[200],
        child: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[600],
                    ),
                    child: Icon(Icons.attach_money_outlined, color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Text(transactionName,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700]
                    ),
                  ),
                ],
              ),
              Text((expenseOrIncome == 'expense' ? '-' : '+') + "\$$money" ,
                  style:TextStyle ( color: expenseOrIncome == 'expense' ? Colors.red : Colors.green )
              )
            ],
          )

        ),
      ),
    );
  }
}

import 'package:expense_tracker/top_card.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/transaction_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TopCard(balance: "3478", Expense: '700', Income: '100',),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        TransactionUi(transactionName: 'Food', money: '150', expenseOrIncome: 'expense',)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add , color: Colors.white,),
        backgroundColor: Colors.grey[400],

      ),
    );
  }
}

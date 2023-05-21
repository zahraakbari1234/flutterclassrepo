import 'package:expense_tracker/google_sheet.dart';
import 'package:expense_tracker/loading_circle.dart';
import 'package:expense_tracker/top_card.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/transaction_ui.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}





class _HomePageState extends State<HomePage> {

  bool timerHasStarted = false;

  void startLoading(){
    timerHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(GoogleSheetApi.loading == false){
        setState((){
          //to refresh the page
        });
        timer.cancel();
      }

    });
  }

  final _textControllerAmount = TextEditingController();
  final _textControllerItem = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isIncome = false;

  void enterTransaction(){
    GoogleSheetApi.insert(_textControllerItem.text.trim(), _textControllerAmount.text.trim(),
        _isIncome);
    setState(() {
      //to refresh the page
    });
  }


  void ShowDial(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text('N E W  T R A N S A C T I O N'),
                content: SingleChildScrollView(//because of using keyboard
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Expense'),
                          Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          const Text('Income'),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount?',
                                ),

                                //validator is just for form
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: _textControllerAmount,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'For what?',
                              ),
                              controller: _textControllerItem,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.grey[600],
                    child:
                    const Text('Cancel', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child: const Text('Enter', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        enterTransaction();
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );

        });
  }


  @override
  Widget build(BuildContext context) {

    if(GoogleSheetApi.loading = true && timerHasStarted == false){
      startLoading();
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TopCard(
                balance: (GoogleSheetApi.calculateIncome() - GoogleSheetApi.calculateExpense()).toString(),
                Expense: GoogleSheetApi.calculateExpense().toString(),
                Income: GoogleSheetApi.calculateIncome().toString(),
              ),
              Expanded(
                child: GoogleSheetApi.loading==true ? LoadingCircle() :  ListView.builder(
                  itemCount: GoogleSheetApi.currentTransaction.length,
                  itemBuilder: (context,index){
                    return TransactionUi(
                      transactionName: GoogleSheetApi.currentTransaction[index][0],
                      money:  GoogleSheetApi.currentTransaction[index][1],
                      expenseOrIncome:  GoogleSheetApi.currentTransaction[index][2],

                    );
                  }

                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed:  ShowDial ,
        child: Icon(Icons.add , color: Colors.white,),
        backgroundColor: Colors.grey[400],

      ),
    );
  }
}





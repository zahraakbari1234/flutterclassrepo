import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create:  (context)=>Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}
class Level1 extends StatelessWidget {
// final String Data ;
// Level1({required this.Data});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  // final String Data ;
  // Level2({required this.Data});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3()
      ],
    );
  }
}

class Level3 extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,

      child: Text(Provider.of<Data>(context, listen: false).data , style: TextStyle(fontSize: 50,
      color: Colors.black)),
    );
  }
}
class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }

}
class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (Val){
        Provider.of<Data>(context,listen: false).changeString(Val);
      },
    );
  }
}
class Data extends ChangeNotifier{
  String data ="Abas";
  void changeString(NewString){
    data = NewString;
    notifyListeners();

  }
}



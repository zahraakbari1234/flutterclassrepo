import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box = Hive.openBox("mybox");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  void write (){
    Hive.box("mybox").put(1,["zahra" , 27 , true ]);
    Hive.box("mybox").put(2,"reza");
    Hive.box("mybox").put(3,"ziba");
    Hive.box("mybox").put(4,"heyday");
    Hive.box("mybox").put(5,"sahar");
  }

  void read (){
    print (Hive.box("mybox").get(1));
    print (Hive.box("mybox").get(2));
    print (Hive.box("mybox").get(3));
    print (Hive.box("mybox").get(4));
    print (Hive.box("mybox").get(5));
  }

  void delete (){
    Hive.box("mybox").delete(1);
    // Hive.box("mybox").delete(2);
    // Hive.box("mybox").delete(3);
    // Hive.box("mybox").delete(4);
    // Hive.box("mybox").delete(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            MaterialButton(onPressed: write , color: Colors.green, child:Text("write")),
            MaterialButton(onPressed: read , color: Colors.blue, child:Text("read")),
            MaterialButton(onPressed: delete , color: Colors.red, child:Text("delete")),
          ]
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Capture image "),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  (imageFile!=null) ?
                  Container(
                    width: 640,
                    height: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: FileImage(imageFile!),
                            fit: BoxFit.cover
                        ),
                        border:  Border.all(
                            width: 8, color: Colors.black12
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),


                  )


                      :
                  Container(
                    width: 640,
                    height: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border:  Border.all(
                            width: 8, color: Colors.black12
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text("image should apear here ", style: TextStyle(
                        fontSize: 26
                    ),),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        getImage(source: ImageSource.gallery);
                      },
                      child: Text("Select image" , style: TextStyle(fontSize: 18),),
                    ),
                  )
                ])));
  }
  void getImage({required ImageSource source }) async{
    final file = await ImagePicker().pickImage(source: source);
    if(file?.path !=null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}


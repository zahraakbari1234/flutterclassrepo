import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                      left: 30,
                      width: 80,
                      height: 250,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/light-1.png"))),
                      )),
                  Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/light-2.png"))),
                      )),
                  Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/clock.png"))),
                      )),
                  Positioned(
                      child: Container(
                    //margin: EdgeInsets.all(),
                    child: const Center(
                        child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0 ,left: 30 , right: 30),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 0.3),
                            offset:Offset(0,10),
                            blurRadius: 20
                        ),
                      ],
                    ),
                     child:Column(
                       children: [
                         Container(
                           padding: EdgeInsets.all(8.0),
                           child: TextField(
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: "Email",
                                 hintStyle: TextStyle(
                                   color: Colors.grey[400],
                                 )
                             ),
                           ),
                         ),
                         Container(
                           padding: EdgeInsets.all(8.0),
                           child: TextField(
                             obscureText: true,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: "Password",
                                 hintStyle: TextStyle(
                                   color: Colors.grey[400],
                                 )
                             ),
                           ),
                         ),
                       ],
                     ),
                  ),
                  // SizedBox(height: 20,),

                  SizedBox(height: 20,),
                  Container(
                    height:50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, 10),
                          ]
                        
                      )
                    ),
                    child:
                      Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text("forget password?",
                  style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 2)
                  ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/coffee_tile.dart';
import 'package:coffee_app/coffee_type.dart';

// enum Type { cappuccino, black, latte, vanila }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Type? selectedType = Type.cappuccino;

  List lstCoffeType = [
    ['cappuccino' , true],
    ['black' , false],
    ['latte' , false]
  ];

  void coffeeTapSelected(int index){
    setState(() {
      for(int i = 0 ; i< lstCoffeType.length ; i++){
        lstCoffeType[i][1] = false;
      }
      lstCoffeType[index][1] = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Find The Best Coffee For You",
              style: GoogleFonts.bebasNeue(fontSize: 36),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find Your Coffee",
                focusedBorder: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.grey.shade600)
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,

            //first prototype
            /*
             child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeType(
                  coffee_type: "cappuccino",
                  isSelected: selectedType == Type.cappuccino ? true : false,
                  onTap: () {
                    setState(() {
                      selectedType = Type.cappuccino;
                    });
                  },
                ),
                CoffeeType(
                  coffee_type: "latte",
                  isSelected: selectedType == Type.latte ? true : false,
                  onTap: () {
                    setState(() {
                      selectedType = Type.latte;
                    });
                  },
                ),
                CoffeeType(
                  coffee_type: "black",
                  isSelected: selectedType == Type.black ? true : false,
                  onTap: () {
                    setState(() {
                      selectedType = Type.black;
                    });
                  },
                ),
                CoffeeType(
                  coffee_type: "vanila",
                  isSelected: selectedType == Type.vanila ? true : false,
                  onTap: () {
                    setState(() {
                      selectedType = Type.vanila;
                    });
                  },
                ),
              ],
            ),
             */

            //second prototype
            child: ListView.builder(
              itemCount: lstCoffeType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index) {
              return CoffeeType(
                  coffee_type: lstCoffeType[index][0],
                  isSelected: lstCoffeType[index][1],
                  onTap: (){coffeeTapSelected(index);} );
            }),
          ),


          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(coffeeImagePath: 'images/cuppochino.jpg', coffeeName: 'cappuccino', CoffeePrice: '24', coffeeDiscription: 'with almond milk',),
              CoffeeTile(coffeeImagePath: 'images/black.jpg', coffeeName: 'black', CoffeePrice: '15', coffeeDiscription: '',),
              CoffeeTile(coffeeImagePath: 'images/latte.jpg', coffeeName: 'latte', CoffeePrice: '32', coffeeDiscription: '',),
            ],
          )),
        ],
      ),
    );
  }
}

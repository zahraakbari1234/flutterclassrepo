import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/coffee_tile.dart';
import 'package:coffee_app/coffee_type.dart';

enum Type { capuchino, black, latte, vanila }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Type? selectedType = Type.capuchino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeType(
                  coffee_type: "Capuchino",
                  isSelected: selectedType == Type.capuchino ? true : false,
                  onTap: () {
                    setState(() {
                      selectedType = Type.capuchino;
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
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(),
            ],
          )),
        ],
      ),
    );
  }
}

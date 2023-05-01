import 'package:flutter/material.dart';


class MyListTile extends StatelessWidget {

  final String iconImagePath;
  final String tileTitle;
  final String tileSubTitle;


  MyListTile({

    required this.iconImagePath,
    required this.tileTitle,
    required this.tileSubTitle,


  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Image.asset(iconImagePath),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tileTitle,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  SizedBox(height: 20,),
                  Text(tileSubTitle , style: TextStyle(
                    color: Colors.grey,
                  ),)
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

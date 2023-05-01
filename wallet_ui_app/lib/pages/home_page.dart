import 'package:flutter/material.dart';
import 'package:wallet_ui_app/utils/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/my_buton.dart';
import '../utils/my_listtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();


    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green,
        child: Icon(Icons.monetization_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home,
              size: 32,
                color: Colors.blue[300],
            ),),
            IconButton(onPressed: (){}, icon: Icon(Icons.settings,
              size: 32,
              color: Colors.black,
            ),),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "My",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      Text(
                        "Cards",
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.add),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: [
                  my_card(
                    balance: 346.64,
                    cartNumber: 334534661322,
                    expireMonth: 12,
                    expireYear: 02,
                    color: Colors.deepPurple[300],
                  ),
                  my_card(
                    balance: 5346.64,
                    cartNumber: 4546465776,
                    expireMonth: 06,
                    expireYear: 05,
                    color: Colors.lightBlue[300],
                  ),
                  my_card(
                    balance: 677.64,
                    cartNumber: 4328445776,
                    expireMonth: 02,
                    expireYear: 04,
                    color: Colors.orange[300],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  buttonCaption: "SEND",
                  imagePath: 'icon/send-money.png',
                ),
                MyButton(
                  buttonCaption: "BILLS",
                  imagePath: 'icon/bill.png',
                ),
                MyButton(
                  buttonCaption: "PAY",
                  imagePath: 'icon/credit-card.png',
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyListTile(
              iconImagePath: 'icon/statistics.png',
              tileTitle: 'Statistics',
              tileSubTitle: 'Payment and Income',
            ),
            MyListTile(
              iconImagePath: 'icon/transaction.png',
              tileTitle: 'Transaction',
              tileSubTitle: 'Transaction history',
            ),

          ],
        ),
      )),
    );
  }
}

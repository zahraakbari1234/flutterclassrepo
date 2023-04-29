import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'nu_box.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SongPage(),
  ));
}

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(
              //I added
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: NuBox(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Text('PLAYLIST'),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: NuBox(
                    child: Icon(Icons.menu),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            NuBox(
                child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset("images/cover_art.png"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Gole Goldon",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Hayde",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ],
                )
              ],
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('0:00'),
                Icon(Icons.shuffle_outlined),
                Icon(Icons.repeat),
                Text("3:34"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            NuBox(child: LinearPercentIndicator(
              lineHeight: 10,
              percent: 0.5,
              backgroundColor: Colors.transparent,
              progressColor: Colors.green
            ),),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: NuBox(child:
                      Icon(Icons.skip_previous,
                      size: 32,
                      ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child:
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: NuBox(child:
                      Icon(Icons.play_arrow,
                        size: 32,
                      ),
                      ),
                    ),
                    ),
                    Expanded(child:
                    NuBox(child:
                    Icon(Icons.skip_next,
                      size: 32,
                    ),
                    ),
                    ),
                  ],
                ),
            )
          ],
        ),
      )),
    );
  }
}

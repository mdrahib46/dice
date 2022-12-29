import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Dice',
          style: TextStyle(
              fontFamily: 'BebasNeue', fontSize: 25.0, letterSpacing: 5.0),
        ),
      ),
      body: DicePage(),
    ),
  ));
}
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var lDiceNum = 1;
  var rDiceNum = 2;

  //Define cngeDiceFace() function to change image.
  void cngeDiceFace() {
    setState(() {
      lDiceNum = Random().nextInt(6) + 1;
      rDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              //This codeblocks contains left side's dice
              Expanded(
                child: IconButton(
                  icon: Image.asset('images/dice$lDiceNum.png'),
                  iconSize: 180,
                  onPressed: () {
                    //Call cngeDiceFace() function for right and left dice
                    cngeDiceFace();
                  },
                ),
              ),
              //this code blocks contains right side's dice
              Expanded(
                child: IconButton(
                  icon: Image.asset('images/dice$rDiceNum.png'),
                  iconSize: 180,
                  onPressed: () {
                    //Call cngeDiceFace() function for left and right dice.
                    cngeDiceFace();
                  },
                ),
              ),
            ],
          ),
          //Add SizedBox to create space between images to textbar
          const SizedBox(
            height: 30.0,
          ),

          // Create a container to hold a text in a bar
          Container(
            height: 45.0,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 60.0,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(width: 3.0, color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),

            //Add a box to show a message
            child: const Center(
              child: Text(
                'Tap On The Image & Enjoy!',
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


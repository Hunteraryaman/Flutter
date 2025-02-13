import 'dart:math';
import 'package:flutter/material.dart';
final randomizer = Random(); //thisi is a global variable
class RollDice extends StatefulWidget {
  const RollDice({super.key});
  @override
  State<RollDice> createState() {
    return _RollDiceState();
  }
}
class _RollDiceState extends State<RollDice> {
  //the _ in the begining means that this is a private class of this file
  // var activeDice = 'assets/images/dice-4.png';
  var currentDice1 = 1;
  var currentDice2 = 2;
  void rollDice() {
    // var diceRoll =
    // Random().nextInt(6) + 1; //+1 as it will give value from 0 to 5
    setState(() {
      //this tells flutter to re execute the build of the state class (this class is state class)
      // activeDice = 'assets/images/dice-$diceRoll.png';//this injects values into the string $ is used
      // currentDice = Random().nextInt(6) + 1;//using random here creates a new random object everytime the code is executexd or the set state is executed or the button is pressed so we create a random final object globally which we can reference to create the random number this way the random object is not created and deleted unneserally
      currentDice1 = randomizer.nextInt(6) +
          1; //this will only create random once when the code3e is execouted first it makes it efficient
      currentDice2 = randomizer.nextInt(6) + 1;
    });
    // print('imagechanged'); //this displays only on the debug pannel
  }

  @override
  Widget build(context) {
    return Column(
      //column by defult takes all the available vertical space so center dosnt work in verticle
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/dice-$currentDice1.png',
              width: 200,
            ),
            Image.asset(
              'assets/images/dice-$currentDice2.png',
              width: 200,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ), //this adds a box of a certain size this is added in between textborder and the image
        // const ElevatedButton(onPressed: null, child: Text("data")),
        // const OutlinedButton(onPressed: null, child: Text("hello")),
        // TextButton(onPressed: () {}/**this is a way in which function can be added to the code this does not require a function name */, child: const Text('data')),

        TextButton(
            onPressed:
                rollDice /**here ()parenthesis is not requied this is just passing a pointer to the the function as a value */,
            style: TextButton.styleFrom(
                // padding: const EdgeInsets.all(
                // 20), //adds padding on all direction
                // padding: const EdgeInsets.only(top: 20),//adds only on one direction from the top
                foregroundColor: Colors.blueAccent, //foreground is text colour
                textStyle: const TextStyle(
                    fontSize: 30) //can also use this to add colour
                ),
            child: const Text('data')),
      ],
    );
  }
}

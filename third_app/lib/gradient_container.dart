import 'package:flutter/material.dart';
import 'package:third_app/roll_dice.dart';

// import 'package:third_app/text_styled.dart';

// var startingAlign = Alignment.topCenter; //this is a variable defined//this is auto defined as alignment type as it is initialized
// var endingAlign; //a non initialsied var is dynamic
// Alignment?/* */ endingAlign;//this says that the variable is either alignment or null//
// var endingAlign = Alignment.bottomCenter;

const endingAlign = Alignment.bottomCenter;
const startingAlign = Alignment
    .topCenter; //const is to make this value constant that cannot change it is almost same as final

//if using const we are telling dart that the value that is stored in there is a compile time consttant
// final startingAlign = Alignmenttop();//final used if the value is dynamically calculated on execution of the code

// class GradientContainer extends StatelessWidget {
//   const GradientContainer(this.colour1, this.colour2, this.colour3,
//       {super.key /*this forwards the key to the super class constructor */}); //this is added to give key to the constructer of the parent class statelesswidget
// //  final List Color <gradientColour>
//   final Color colour1;
//   final Color colour2;
//   final Color colour3;

//   //stateless is availabe from the flutter framework we inherit from it
//   @override //this is an anotation
//   Widget build(context) {
//     //widget is the return type  //whenever flutter sees the custom widget it will call thsi build method
//     // endingAlign = Alignment.bottomCenter;
//     return Container(
//       //these are classes which are then instantiated into objects when executing them as a function
//       //useful for configuting style and lahyout settings
//       //container doesnt support setting it to const and non of its parent roots can be set to const
//       decoration: BoxDecoration(
//         //these are configuration objects
//         gradient: LinearGradient(
//           colors: [
//             // Color.fromARGB(255, 176, 25, 25), //these are configutation options
//             // Color.fromARGB(120, 180, 0, 0),
//             // Color.fromARGB(198, 244, 2, 2)
//             colour1,
//             colour2,
//             colour3,
//           ],
//           begin: startingAlign,
//           end: endingAlign,
//         ),
//       ),
//       child: const Center(
//         child: TextStyled('Hello Aryaman!!!!'),
//       ),
//     );
//   }
// } //this is the naming convinction and this is the name as the container will be having a predefined gradient applied to it

// class GradientContainer extends StatefulWidget {//state full allows up to maintain the state within them
// like stateful can be used if something changes in the widget that might then change the ui in the app
class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {required this.colors,
      super.key /*this forwards the key to the super class constructor */}); //this is added to give key to the constructer of the parent class statelesswidget
//  final List Color <gradientColour>

// const GradientContainer.prebuilt({super.key}): colors: const[colours.white,colours.purple];
  const GradientContainer.prebuilted(
      {super.key}) //thisi is a feature where we can define multiple constructor functions
      : colors = const [Colors.white, Colors.purple];

  final List<Color> colors;

  //stateless is availabe from the flutter framework we inherit from it
  @override //this is an anotation
  Widget build(context) {
    //widget is the return type  //whenever flutter sees the custom widget it will call thsi build method
    // endingAlign = Alignment.bottomCenter;
    return Container(
      //these are classes which are then instantiated into objects when executing them as a function
      //useful for configuting style and lahyout settings
      //container doesnt support setting it to const and non of its parent roots can be set to const
      decoration: BoxDecoration(
        //these are configuration objects
        gradient: LinearGradient(
          colors: colors,
          // [
          // Color.fromARGB(255, 176, 25, 25), //these are configutation options
          // Color.fromARGB(120, 180, 0, 0),
          // Color.fromARGB(198, 244, 2, 2)
          // colour1,
          // colour2,
          // colour3,
          // ],
          begin: startingAlign,
          end: endingAlign,
        ),
      ),
      child: const Center(
        child: RollDice(),
      ),
    );
  }
} //this is the naming convinction and this is the name as the container will be having a predefined gradient applied to it

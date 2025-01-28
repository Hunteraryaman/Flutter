import 'package:flutter/material.dart'; //imported from the flutter docs https://github.com/flutter/flutter/blob/f699eb0be0a0cfcf34e2b6c0e402a18d76a96f2e/packages/flutter/lib/src/widgets/binding.dart#L1078
import 'package:third_app/gradient_container.dart';

//defining a function
void main() {
  //main doesnt require to be executed it is automatically exexuted by dart when the app is active
//executing a function
  runApp(const MaterialApp(
    home: Scaffold(
      //creates a kind of screen or background
      // backgroundColor: const Color.fromARGB(255, 24, 255, 101),
      body: GradientContainer(
          // col[
          // Color.fromARGB(255, 176, 25, 25),
          // Color.fromARGB(120, 180, 0, 0),
          // Color.fromARGB(198, 244, 2, 2),
          colors: [
            Color.fromARGB(255, 176, 25, 25),
            Color.fromARGB(120, 180, 0, 0),
            Color.fromARGB(198, 244, 2, 2)
          ]
          // Color.fromARGB(120, 180, 0, 0),
          // Color.fromARGB(198, 244, 2, 2),],]),
          ),
    ),
  )); //it is a function that is provided by flutter and prebuilt this is all about runing the app its main job is to show user interface in the screen
  //needs an argument to display something on the screen
  // material app is a type of constructor
  //const helps reduce memory usage as it prevents the dublication of the memory space and allows reausability od memory for the same widget it alows dart to run the app in a more efficient way
  //scaffold helps use set agood looking screen in the app
}

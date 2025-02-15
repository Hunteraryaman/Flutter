import 'package:expence_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  // seedColor: const Color.fromARGB(255, 64, 14, 178),
  seedColor: const Color.fromARGB(255, 255, 76, 5),
);
//starting with k is for global variables thsi is a convenction
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  //this optimises for dark mode tells flutter that this is a color scheme for dark mode
  seedColor: const Color.fromARGB(2, 61, 0, 0),
);
void main() {
//   WidgetsFlutterBinding.ensureInitialized();
// //  this is require to make sure that locking the orientation and then running the app works as intended
//   //this gives a future
//   //future provides a then method which then wants a function as a value which will be executed once the future is done with the task
//   SystemChrome.setPreferredOrientations(
//     [
//       //this takes a list of all orientations that we allow
//       //this prevents the app from adjusting to the other orientation of the device
//       DeviceOrientation.portraitUp,
//       // DeviceOrientation.portraitDown,
//       //this disabled means that the app will not be able to rotate to the other orientation
//     ],
//   ).then(
//     (fn) {
// //this then also recieves another function as a input itself but we dont need to worry about it as we dont need to do anything with that function so we just have to accept it

//run app only executes once the future is done with the task that is once the orientaion is locked
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        //  appBarTheme: const AppBarTheme().copyWith(
        //   backgroundColor: kDarkColorScheme.onSecondaryContainer,
        //   foregroundColor: kDarkColorScheme.inversePrimary,
        // ),
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          shadowColor: kDarkColorScheme.onSurface,
          // color: kDarkColorScheme.primaryFixedDim,
          color: kDarkColorScheme.secondary,

          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
          //style from uses flutters default styilling and allows us to override selected styles
        ),
        //using themedata here ensures that the text is not changed globaly but only for the ones i want
        textTheme: ThemeData().textTheme.copyWith(
              //here this ensures that we are overiding the texttheme that belongs to my themedata object
              titleLarge: TextStyle(
                //this is for the title
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kDarkColorScheme.scrim,
              ),

              displayMedium: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: kDarkColorScheme.error,
              ),
              bodyMedium: TextStyle(
                //this is for the date in the modal overlay
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: kDarkColorScheme.error,
              ),
              bodyLarge: TextStyle(
                //this is for the title and amount in the modal overlay
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: kDarkColorScheme.error.withValues(alpha: 0.7),
              ),
            ),
      ),
      // ignore: deprecated_member_use
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 97, 180, 90),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onSecondaryContainer,
          foregroundColor: kColorScheme.inversePrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          shadowColor: kColorScheme.inversePrimary,
          color: kColorScheme.errorContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
          //style from uses flutters default styilling and allows us to override selected styles
        ),
        //using themedata here ensures that the text is not changed globaly but only for the ones i want
        textTheme: ThemeData().textTheme.copyWith(
              //here this ensures that we are overiding the texttheme that belongs to my themedata object
              titleLarge: TextStyle(
                //this is for the title
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kColorScheme.inverseSurface,
              ),
            ),
      ),
      // themeMode: ThemeMode.system,//this is the default
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    ),
  );
  // },
  // );
}

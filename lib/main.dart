import 'package:expenses/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Expenses());
}

var myColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
var myDarkColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: myColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myColorScheme.primaryContainer,
            )),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: myColorScheme.onSecondaryContainer,
              fontSize: 17,
            )
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          bottomSheetTheme: const BottomSheetThemeData().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer
          ),
          colorScheme: myDarkColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer,
            foregroundColor: myDarkColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: myDarkColorScheme.secondaryContainer,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myDarkColorScheme.primaryContainer,
          )),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.onSecondaryContainer,
            fontSize: 17,
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

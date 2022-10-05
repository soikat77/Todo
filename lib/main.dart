import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/themes/color_schemes.g.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // init hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('myBox');

  //run
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /* ------------------------------- Light Theme ------------------------------ */
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        // Define the default font family.
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          headline6: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),

      /* ------------------------------- Dark Theme ------------------------------- */
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        // Define the default font family.
        // fontFamily: 'poppins',
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          headline6: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

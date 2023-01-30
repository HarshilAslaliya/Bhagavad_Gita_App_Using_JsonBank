// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:json_file/views/screens/homepage.dart';
import 'package:json_file/views/screens/intro_page.dart';
import 'package:json_file/views/screens/versedetails.dart';
import 'package:json_file/views/screens/versepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool GetStarted = prefs.getBool("GetStarted") ?? false;
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.orange,secondary: Colors.orange),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: (GetStarted == false) ? 'intro' : '/',
      routes: {
        '/': (context) => const HomePage(),
        'intro': (context) => const IntroPage(),
        'verse_page':(context)=>const VersesPage(),
        'verses_details':(context)=>const VerseDetails(),
      },
    ),
  );
}

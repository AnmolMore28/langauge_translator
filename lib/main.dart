import 'package:flutter/material.dart';

import 'language_translate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Langauge Translator Application',
      debugShowCheckedModeBanner: false,
      home: LanguagetranlatorPage(),
    );
  }
}





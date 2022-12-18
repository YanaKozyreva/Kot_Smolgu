import 'dart:html';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void launchSmolgu() async {
    final Uri urll = Uri(scheme: "https", host: "smolgu.ru");
    if (!await launchUrl(urll, mode: LaunchMode.externalApplication)) {
      throw "Error";
    }
  }
  void launchGit() async {
    final Uri urll = Uri(scheme: "https", host: "github.ru", path:"/YanaKozyreva/kot");
    if (!await launchUrl(urll, mode: LaunchMode.externalApplication)) {
      throw "Error";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0,42,0,0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Это моё приложение на Flutter!',
                        textDirection: TextDirection.ltr
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0,42,0,0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: OutlinedButton(onPressed: launchGit, child: const Text('перейти на гит')),
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0,20,5,0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(onPressed: launchSmolgu, child: const Text('перейти на сайт СмолГУ!')),
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20,120,20,42),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("images/123.jpg"),
                )
            ),
          ],
        )
    );
  }
}

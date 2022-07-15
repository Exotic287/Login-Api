import 'package:flutter/material.dart';
import 'package:tugas4/view/dosen.dart';
import 'package:tugas4/view/login.dart';
import 'package:tugas4/view/mahasiswa.dart';
import 'package:tugas4/view/orangTua.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext conntext) => new LoginPage(),
        '/mahasiswa': (BuildContext conntext) => new MahasiswaPage(),
        '/dosen': (BuildContext conntext) => new DosenPage(),
        '/orangTua': (BuildContext conntext) => new OrangTuaPage(),
      },
    );
  }
}


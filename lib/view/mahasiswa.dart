import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MahasiswaPage extends StatefulWidget {
  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {

  logut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', false);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mahasiswa"),
          actions: [
          IconButton(
            onPressed: () => logut(),
            icon: const Icon(Icons.logout),
          )
        ],
        ),
        body: SafeArea(
          child: new Container(
              color: Colors.white,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Mahasiswa'),
                    ]),
              )),
        ));
  }
}

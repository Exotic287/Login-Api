import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrangTuaPage extends StatefulWidget {
  @override
  State<OrangTuaPage> createState() => _OrangTuaPageState();
}

class _OrangTuaPageState extends State<OrangTuaPage> {

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
          title: Text("Orang Tua"),
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
                      Text('Orang Tua'),
                    ]),
              )),
        ));
  }
}

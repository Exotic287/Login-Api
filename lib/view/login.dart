import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variabel
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bagianController = TextEditingController();
  List<String> _listBagian = ['mahasiswa', 'dosen', 'orang tua'];
  bool showPass = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showPass;
  }
  
  Future<List> login() async {
    var body = {
      "username": usernameController.text,
      "password": passwordController.text,
      "bagian": bagianController.text
    };
    final data = await http.post(Uri.parse("https://glass-faced-doubt.000webhostapp.com/api.php"),
        body: body);
    var dataUser = json.decode(data.body);
    // print(dataUser);

    if (dataUser.length == 0) {
      AlertDialog(
        title: Text('Pesan'),
        content: Text('Gagal Login'),
        actions: <Widget>[
          RaisedButton(
            child: Icon(Icons.check),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    } else {
      if (dataUser[0]["bagian"] == 'mahasiswa') {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/mahasiswa', (Route<dynamic> route) => false);
      } else if (dataUser[0]['bagian'] == 'dosen') {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/dosen', (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/orangTua', (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: showPass,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return Padding(
                          padding: EdgeInsets.all(10),
                          child: DropdownSearch(
                            showClearButton: true,
                            mode: Mode.MENU,
                            showSelectedItems: true,
                            items: _listBagian,
                            dropdownSearchDecoration: InputDecoration(
                              hintText: 'Bagian',
                              hintStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(
                                Icons.people,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) {
                              print(value);
                              bagianController.text = value;
                            },
                          ));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: MaterialButton(
                        minWidth: 200,
                        height: 42,
                        onPressed: () => login(),
                        color: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(22.0)),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

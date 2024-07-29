import 'package:flutter/material.dart';
import 'package:test3/password_forget.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: const Signup(),
      routes: {
        '/Home':(context)=> const HomePage(),
        '/P1': (context) => const passwordPage(),

      },
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String username;
  late String password;
  late String ID;
  late String mail;


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Kullanıcı adı ve parola kaydedildi
      print("Kullanıcı Adı: $username, Parola: $password , T.C kimlik: $ID, Mail: $mail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Kendine Yardım'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home'); // Ana sayfaya yönlendirme
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Positioned.fill(
            child: Image.asset(
              'android/assets/arkaplan.png',
              fit: BoxFit.cover,
            ),
          ),
          // Form container
          Align(
            alignment: Alignment(0.8,0), // Sağa hizalama
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth * 0.8;
                double minWidth = 500;
                double maxWidth = 450;

                return Container(
                  width: width < minWidth ? minWidth : (width > maxWidth ? maxWidth : width),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple .withOpacity(0.25),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 60,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Kullanıcı Adı",
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Kullanıcı Adını Giriniz";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              username = value!;
                            },
                            onFieldSubmitted: (value) {
                              _submitForm();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 60,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Parola",
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.black),
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Parolayı Giriniz";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password = value!;
                            },
                            onFieldSubmitted: (value) {
                              _submitForm();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 60,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "E posta",
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.black),
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "E postayı Giriniz";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              mail = value!;
                            },
                            onFieldSubmitted: (value) {
                              _submitForm();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 60,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "T.C Kimlik Numarası",
                              labelStyle: TextStyle(color: Colors.teal),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.black),
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "T.C Kimlik Numarası Giriniz";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              ID = value!;
                            },
                            onFieldSubmitted: (value) {
                              _submitForm();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width < minWidth
                                ? minWidth
                                : (width > maxWidth ? maxWidth : width),
                            minHeight: 50,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: _submitForm,
                            child: const Text("Üye Ol"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

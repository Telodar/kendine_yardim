import 'package:flutter/material.dart';
import 'package:test3/password_forget.dart';
import 'package:test3/signupPage.dart';
import 'home_page.dart';
import 'module_1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: const profilePage(),
      routes: {
        '/Home': (context) => const HomePage(),
        '/P1': (context) => const passwordPage(),
        '/S1': (context) => const Signup(),
        '/M1': (context) => const M1Page(),
      },
    );
  }
}

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String username;
  late String password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Kullanıcı adı ve parola kaydedildi
      print("Kullanıcı Adı: $username, Parola: $password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Profiliniz'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home'); // Ana sayfaya yönlendirme
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer(); // Drawer'ı sağ taraftan aç
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3D1953).withOpacity(0.6),
              ),
              child: Text(
                'Modüller',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pushNamed(context, ''); // Mesajlar sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.view_module),
              title: Text('Modüller'),
              onTap: () {
                Navigator.pushNamed(context, '/M1'); // Profil sayfasına git fonksiyonu
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mesajlar'),
              onTap: () {
                Navigator.pushNamed(context, '/M3'); // Ayarlar sayfasına git fonksiyonu
              },
            ),
          ],
        ),
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
            alignment: Alignment(0.8, 0), // Sağa hizalama
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth * 0.8;
                double minWidth = 500;
                double maxWidth = 450;

                return Container(
                  width: width < minWidth
                      ? minWidth
                      : (width > maxWidth ? maxWidth : width),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF3D1953).withOpacity(0.7),
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
                              labelStyle: TextStyle(color: Colors.white70),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.white70),
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
                              labelStyle: TextStyle(color: Colors.white70),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: TextStyle(color: Colors.white70),
                            obscureText: true,
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
                            minHeight: 50,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              backgroundColor: Color(0xFF069BBF), // Set the button color here
                              foregroundColor: Colors.white, // Set the text color here
                            ),
                            onPressed: _submitForm,
                            child: const Text("Giriş yap"),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // orta hiza
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/S1'); // Üye ol butonu tıklama işlemleri
                              },
                              child: Text(
                                "Üye Ol",
                                style: TextStyle(color:Colors.white), // Set the text color here
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/P1'); // Şifremi unuttum butonu tıklama işlemleri
                              },
                              child: Text(
                                "Şifremi Unuttum",
                                style: TextStyle(color: Colors.white), // Set the text color here
                              ),
                            ),
                          ],
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

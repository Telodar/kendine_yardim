import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'module_1_1.dart';
import 'module_1_2.dart';
import 'module_1_3.dart';
import 'module_1_4.dart';
import 'module_1_5.dart';
import 'module_1_6.dart';
import 'module_1_7.dart';
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'signupPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      home: const LoginPage(),
      routes: {
        '/Login': (context) => const LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const Mtable(),
        '/M3': (context) => const M3Page(),
        '/M5': (context) => const M5Page(),
        '/M4': (context) => const M4Page(),
        '/M6': (context) => const M6Page(),
        '/M7': (context) => const M7Page(),
        '/M8': (context) => const M8Page(),
        '/M0': (context) => const Mtable(),
        '/P1': (context) => const passwordPage(),
        '/S1': (context) => const Signup(),
        '/P2': (context) => const ProfilePage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: isMobile
            ? const Text('Kendine Yardım')
            : Row(
          children: [
            Image.asset(
              'android/assets/goplogo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text('Kendine Yardım'),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        actions: isMobile
            ? null
            : [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Login');
            },
            child: const Text(
                'Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text(
                'Ana Sayfa', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M0');
            },
            child: const Text(
                'Kendi Kendine Yardım', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M6');
            },
            child: const Text(
                'Ekibimiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      endDrawer: isMobile
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Text(
                  'Menü', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Giriş Yap'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Login');
              },
            ),
            ListTile(
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Kendi Kendine Yardım'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/M0');
              },
            ),
            ListTile(
              title: const Text('Ekibimiz'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/M6');
              },
            ),
          ],
        ),
      )
          : null,
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
                      color: Color(0xFF069BBF).withOpacity(0.7),
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
                                backgroundColor: Color(0xFF3D1953), // Set the button color here
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
                                  Navigator.pushReplacementNamed(context, '/S1'); // Üye ol butonu tıklama işlemleri
                                },
                                child: Text(
                                  "Üye Ol",
                                  style: TextStyle(color: Colors.white), // Set the text color here
                                ),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/P1'); // Şifremi unuttum butonu tıklama işlemleri
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
        )
    );
  }
}
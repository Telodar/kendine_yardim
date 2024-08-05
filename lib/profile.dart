import 'package:flutter/material.dart';
import 'package:test3/home_page.dart';
import 'login.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_5.dart';
import 'module_6.dart';
import 'module_7.dart';
import 'module_8.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'signupPage.dart';
//#TODO: Yeni Appbar

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
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      home: const HomePage(),
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
      },
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Row(
          children: [
            Image.asset(
              'android/assets/goplogo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            SizedBox(width: 8),
            Text('Kendine Yardım'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Login');
            },
            child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/'); // Ana sayfaya yönlendirme
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
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
                color: Color(0xFF3D1953).withOpacity(0.5),
              ),
              child: Text(
                'Gazi Osman Paşa Üniversitesi Kendine Yardım Portalı',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.view_module),
              title: Text('Modüller'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/M1');
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mesajlar'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15.0),
          ),
          constraints: BoxConstraints(
            maxWidth: 650,
            maxHeight: 650,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'android/assets/goplogo.png',
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Kullanıcı Adı: [Kullanıcı Adı]',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kimlik Bilgileri: [Kimlik Bilgileri]',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle password change
                },
                child: Text('Şifre Değiştir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

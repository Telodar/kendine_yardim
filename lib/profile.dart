import 'package:flutter/material.dart';
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
import 'login.dart';

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
      home: const ProfilePage(),
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


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


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
import 'package:flutter/material.dart';
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
import 'profile.dart';
import 'package:photo_view/photo_view.dart';
import 'home_page.dart';

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
        '/P2': (context) => const ProfilePage(),
      },
    );
  }
}

class M3Page extends StatefulWidget {
  const M3Page({super.key});

  @override
  State<M3Page> createState() => _M3PageState();
}

class _M3PageState extends State<M3Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showPhoto(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: PhotoView(
              imageProvider: AssetImage(imagePath),
              backgroundDecoration: BoxDecoration(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: isMobile
            ? const Text('1. Bölüm 3. Sayfa')
            : Row(
          children: [
            Image.asset(
              'android/assets/goplogo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text('1. Bölüm 3. Sayfa'),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.purple],
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
                '1. Bölüm 3. Sayfa', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M1');
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
                  colors: [Colors.green, Colors.purple],
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
                Navigator.pushReplacementNamed(context, '/M1');
              },
            ),
          ],
        ),
      )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'android/assets/arkaplan.png', // Arka plan resminizin yolu
              fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde ölçekle
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 650),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Ortala
                crossAxisAlignment: CrossAxisAlignment.center, // Ortala
                children: [
                  SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
                  Container(
                    constraints: BoxConstraints(maxWidth: 650),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFF069BBF).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      "Belki hayatınız ile Ayşe’nin hayatı arasında bazı benzerlikleri ve farklılıkları görmüşsünüz. Çalışmanın bu"
                          "kısmında Ayşe’nin yaşadığı durumlardaki davranışlarını birlikte analiz edelim. Sonra da siz yaşadığınız"
                          "durumlarda kendi davranışlarınızın analizini yapabileceksiniz.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20), // Metin ile resim arasında 20 piksel boşluk
                  Container(
                    width: 650,
                    height: 365, // En-boy oranını korumak için uygun yüksekliği ayarlayın
                    child: GestureDetector(
                      onTap: () => _showPhoto(context, 'android/assets/Module_3.png'),
                      child: Image.asset(
                        'android/assets/Module_3.png',
                        fit: BoxFit.contain, // Resmin oranını koruyarak görüntüle
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(maxWidth: 650),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFF069BBF).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      "Şimdi odaklanmaya karar verdiğiniz sorun üzerinde duralım. Bu sorunu en son ne zaman ve nerede"
                          "yaşadınız? Öncelikle olayla ilgili A sütununda yazılı olan soruları altına cevaplarını yazınız. Daha sonra"
                          "bütün bu duygu düşünce ve bedensel hisler geldiğinde ne yaptığınızı B sütununa yazın. Daha sonra"
                          "bu olayın kısa ve uzun vadede ne gibi sonuçlar ortaya çıkardığını da C sütununa yazınız.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 650,
                    height: 365, // En-boy oranını korumak için uygun yüksekliği ayarlayın
                    child: GestureDetector(
                      onTap: () => _showPhoto(context, 'android/assets/Module_3_1.png'),
                      child: Image.asset(
                        'android/assets/Module_3_1.png',
                        fit: BoxFit.contain, // Resmin oranını koruyarak görüntüle
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/M0');
                    },
                    child: Text('Başla'),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
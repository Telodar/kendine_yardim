import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home_page.dart';
import 'login.dart';
import 'module_1_1.dart';
import 'module_1_2.dart';
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
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

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

  Widget _buildTextContainer(double width, double height) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height,
      ),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                "Belki hayatınız ile Ayşe’nin hayatı arasında bazı benzerlikleri ve farklılıkları görmüşsünüz. Çalışmanın bu"
                    "kısmında Ayşe’nin yaşadığı durumlardaki davranışlarını birlikte analiz edelim. Sonra da siz yaşadığınız"
                    "durumlarda kendi davranışlarınızın analizini yapabileceksiniz.",
                style: TextStyle(color: Colors.black, fontSize: 20),
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
            ]
        ),
      ),
    );
  }
  Widget _buildTextContainer2 (double width, double height) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height,
      ),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                "Şimdi odaklanmaya karar verdiğiniz sorun üzerinde duralım. Bu sorunu en son ne zaman ve nerede"
                    "yaşadınız? Öncelikle olayla ilgili A sütununda yazılı olan soruları altına cevaplarını yazınız. Daha sonra"
                    "bütün bu duygu düşünce ve bedensel hisler geldiğinde ne yaptığınızı B sütununa yazın. Daha sonra"
                    "bu olayın kısa ve uzun vadede ne gibi sonuçlar ortaya çıkardığını da C sütununa yazınız.",
                style: TextStyle(color: Colors.black, fontSize: 20),
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
            ]
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
            const Text('1. Bölüm 1. Sayfa'),
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
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text(
                'Kaydet & Ara Ver', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text(
                'Kaydetmeden Çık', style: TextStyle(color: Colors.white)),
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
              title: const Text('Kaydet & Ara Ver'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Login');
              },
            ),
            ListTile(
              title: const Text('Kaydetmeden Çık'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (isMobile)
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: _buildTextContainer(3000, 3000),
                    ),
                    SizedBox(height: 20),
                    Container(
                      constraints: BoxConstraints(maxWidth: 650),
                      child:
                      Center(
                      child: GestureDetector(
                        onTap: () =>
                            _showPhoto(context, 'android/assets/module6.png'),
                        child: Image.asset(
                          'android/assets/module6.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ),
                    SizedBox(height: 30),

                      Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: _buildTextContainer2(3000, 3000),
                      ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            )
          else
            SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.85,
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: Center(
                              child: _buildTextContainer(1000, 1000),
                            ),
                          ),
                          // Biraz boşluk eklemek isterseniz
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.85,
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: Center(
                              child: _buildTextContainer2(1000, 1000),
                            ),
                          ),
                          // Biraz boşluk eklemek isterseniz
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

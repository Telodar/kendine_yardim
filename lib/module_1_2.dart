import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home_page.dart';
import 'login.dart';
import 'module_1_1.dart';
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

class M2Page extends StatefulWidget {
  const M2Page({super.key});

  @override
  State<M2Page> createState() => _M2PageState();
}

class _M2PageState extends State<M2Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<TextEditingController> _textControllers = List.generate(5, (index) => TextEditingController());
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  void _submitForm() {
    for (var controller in _textControllers) {
      print(controller.text); // Terminale yazdırma
      controller.clear(); // Textbox'ı temizleme
    }
    Navigator.pushReplacementNamed(context, '/M3'); // /M3 sayfasına yönlendirme
  }


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
              Text(
        "Hepimiz zaman zaman Ayşe ya da Efe gibi zor dönemler geçirebiliriz.",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                " Fakat bu süre"
                    "uzadığında kendimizle ilgili duygu düşünceler ve bedenimizde hissettiklerimiz"
                    "yoğunlaştığında sanki bir çıkmaz sokağa girmiş ve orada sıkışmış gibi hissedebiliriz. Gelin"
                    "bu sokakta başlayan yolculuğa birlikte çıkalım."
                    "Bugün yolculuğun başındayız, peki siz yolculuğun başarılı bir şekilde gerçekleştiğini siz"
                    "nereden anlayacaksınız? Yolculuğun sonuna geldiğimizi siz nereden anlayacaksınız? Artık"
                    "bugünden farklı olarak neyi yapmaya başlıyor olacaksınız? Bu süreçteki hedefleriniz"
                    "neler?"
                    "Kaygınızı azaltmayı veya kontrol etmeyi istediğinizi ya da içinde buluduğunuz olumsuz"
                    "bu duygudurumdan kurtulmak istediğinizi, daha mutlu veya özgüvenli olmayı istediğinizi"
                    "tahmin edebiliyorum. Ama benim asıl sormak istediğim bütün bunlar olduğunda siz ne"
                    "yapıyor olacaksınız? Aşağıya neler yapıyor olacağınızı belirtiniz.",
                style: TextStyle(color: Colors.black, fontSize: 20,),
              ),
              SizedBox(height: 30),
              Container(
                constraints: BoxConstraints(maxWidth: 1000),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Gri renk
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _textControllers[i],
                          decoration: InputDecoration(
                            labelText: 'Mesaj ${i + 1}',
                            border: UnderlineInputBorder(),
                          ),
                          onSubmitted: (value) {
                            _submitForm();
                          },
                        ),
                      ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Gönder'),
                    ),
                  ],
                ),
              ),
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
            ? const Text('1. Bölüm 1. Sayfa')
            : Row(
          children: [
            Image.asset(
              'android/assets/goplogo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text('1. Bölüm 2. Sayfa'),
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
                      child: GestureDetector(
                        onTap: () =>
                            _showPhoto(context, 'android/assets/module6.png'),
                        child: Image.asset(
                          'android/assets/module6.png',
                          fit: BoxFit.contain,
                        ),
                      ),
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        padding: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: GestureDetector(
                          onTap: () => _showPhoto(context, 'android/assets/goplogo.png'),
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.asset(
                                'android/assets/module6.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
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

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
import 'home_page.dart';
import 'package:photo_view/photo_view.dart';
import 'module_6v2.dart';

//#TODO: Diğer Text ve fotoğraf içeren modüllerin de aynı düzlemde güncellenmesi

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
        '/M61': (context) => const M6v1Page(),
        '/M62': (context) => const M6v2Page(),
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

class M6v1Page extends StatefulWidget {
  const M6v1Page({super.key});

  @override
  State<M6v1Page> createState() => _M6v1PageState();
}

class _M6v1PageState extends State<M6v1Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

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
              "Bir de süreci daha iyi anlayabilmek için uçurumun kenarındaki canavara bakalım.",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
              SizedBox(height: 20),
              Text(
                    "Bir uçurumun kenarındasınız ve uçurumun diğer tarafında bir canavar var. Uçurumun ortasında bir"
                    "halat var. Bir ucunu siz diğer tarafını bu canavar tutuyor. Canavardan kurtulmak için onu"
                    "uçurumdan aşağı düşürmek gerekiyor. Halatı hızlıca çekerek canavarı uçurumdan aşağı düşürmek"
                    "istiyorsunuz ve halatı var gücünüzle çekiyorsunuz fakat siz halatı ne kadar güçlü çekerseniz"
                    "karşıdaki canavar da aynı güçte halatı çekmeye başlıyor. Bazen yoruluyorsunuz, titriyorsunuz"
                    "canavar sizi uçurumun kenarına getiriyor sonra tekrar asılıp çekmeye devam ediyorsunuz. Siz"
                    "halatı çektikçe canavar daha da güçleniyor o da kuvvetlice çekiyor. Bu durumda ne yapabilirsiniz?"
                    "Unutmayın daha güçlü çektiğinizde o da aynı güçle çekiyor. Halatı çekmeye devam ederken o"
                    "sırada hayatınızda olanlarla ilgilenemiyor dikkatinizi sadece halatı çekmeye verebiliyorsunuz."
                    "Arkadaşlarınızla, ailenizle vakit geçiremiyor, geçirseniz bile o sırada halatı çekmeye devam"
                    "ediyorsunuz. Onlarla vakit geçirmek istiyorsunuz ya da derslerine odaklanmak istiyorsunuz ama"
                    "aynı zamanda içinde bulunduğun bir halat çekme yarışına da sahipsiniz ve onu da kazanmayı çok"
                    "istiyorsunuz. Daha ne kadar bu mücadeleye devam edebilirsiniz?",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 16),
              Center(
                  child:ElevatedButton
                    (
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/M62');
                      },
                      child: Text('Devam et')
                  )
              )
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
            child: const Text('Giriş Yap',
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Ana Sayfa',
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M0');
            },
            child: const Text('Kendi Kendine Yardım',
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M1');
            },
            child: const Text('Ekibimiz',
                style: TextStyle(color: Colors.white)),
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
              child: const Text('Menü',
                  style:
                  TextStyle(color: Colors.white, fontSize: 24)),
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


          if (isMobile)
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  children: [
                    SizedBox( height: 40),
                    Container(

                      constraints: BoxConstraints(maxWidth: 650),
                      child: GestureDetector(
                        onTap: () =>
                            _showPhoto(context, 'android/assets/module6_1.png'),
                        child: Image.asset(
                          'android/assets/module6_1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      constraints: BoxConstraints(maxWidth: 650),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: _buildTextContainer(2000, 2000),
                    ),
                    SizedBox(height: 20),

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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        constraints: BoxConstraints(maxWidth: 650),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.8), // Added for consistency
                        ),
                        child: Center(
                          child: _buildTextContainer(1000,1000),
                        ),
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
                          onTap: () => _showPhoto(context, 'android/assets/module6_1.png'),
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.asset(
                                'android/assets/module6_1.png',
                                fit: BoxFit.contain,
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

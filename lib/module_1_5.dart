import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home_page.dart';
import 'login.dart';
import 'module_1_1.dart';
import 'module_1_2.dart';
import 'module_1_3.dart';
import 'module_1_4.dart';
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

class M5Page extends StatefulWidget {
  const M5Page({super.key});

  @override
  State<M5Page> createState() => _M5PageState();
}

class _M5PageState extends State<M5Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  void _submitForm() {
    print('Cevap 1: ${_controller1.text}');
    print('Cevap 2: ${_controller2.text}');
    print('Cevap 3: ${_controller3.text}');
    print('Cevap 4: ${_controller4.text}');
    print('Cevap 5: ${_controller5.text}');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();

    // Formu gönderdikten sonra M6Page'e yönlendirme
    Navigator.pushReplacementNamed(context, '/M6');
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
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 650),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Ortala
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
                    _buildQuestionContainer(
                      "Şimdi bu kontrol yöntemleri ile ilgili aşağıdaki soruları kendinize sorun ve her birini cevapladıktan sonra diğer soruya geçiniz.",
                      _controller1,
                    ),
                    _buildQuestionContainer(
                      "Kontrol yöntemi uyguladığımda içsel deneyimle (duygu, düşünce ve bedensel hisler) başa çıkmak kısa vadede kolaylaşıyor gibi görünebilir. Peki ya uzun vadede kolaylaşıyor mu, zorlaşıyor mu?",
                      _controller2,
                    ),
                    _buildQuestionContainer(
                      "Kendinizi değerlendirdiğinizde bu stratejilerden hangilerini, ne sıklıkta kullanıyorsunuz?",
                      _controller3,
                    ),
                    _buildQuestionContainer(
                      "Bu stratejilerden herhangi birini uygulamak hayatınızı nasıl etkiliyor? (zaman ve para maliyeti açısından? Sağlık, boş zaman ve ilişkiler açısından?)",
                      _controller4,
                    ),
                    _buildQuestionContainer(
                      "İç deneyimlerinize (duygu, düşünce ve bedensel hisler) karşı bu mücadeleyi daha ne kadar sürdürebilirsiniz?",
                      _controller5,
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Peki bu sorulara verdiğiniz cevaplardan sonra İçsel deneyimlerinizi kontrol etmeye yönelik bu"
                                  " girişimlerin iyi sonuç vermediğini veya kısmen sonuç verdiğini ve oldukça fazla zaman ve "
                                  "enerji harcadığınızı söyleyebilir misiniz?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Gönder'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _buildQuestionContainer(
    String question, TextEditingController controller) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(bottom: 30),
    constraints: BoxConstraints(maxWidth: 650),
    decoration: BoxDecoration(

      color: Color(0xFF069BBF).withOpacity(0.8),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Cevabınızı buraya yazınız',
          ),
        ),
      ],
    ),
  );
}

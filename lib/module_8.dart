import 'package:flutter/material.dart';
import 'login.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'home_page.dart';
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
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//#TODO: appbar buton üdzenlemesi

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

class M8Page extends StatefulWidget {
  const M8Page({super.key});

  @override
  State<M8Page> createState() => _M8PageState();
}

class _M8PageState extends State<M8Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  String _selectedOption = '';

  void _submitForm() {
    print('Cevap 1: ${_controller1.text}');
    print('Cevap 2: ${_controller2.text}');
    print('Cevap 3: ${_controller3.text}');
    print('Cevap 4: ${_controller4.text}');
    print('Çalışma Süresi: $_selectedOption');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    setState(() {
      _selectedOption = '';
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: Text('Formu göndermek istediğinizden emin misiniz?'),
          actions: <Widget>[
            TextButton(
              child: Text('Hayır'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Evet'),
              onPressed: () {
                Navigator.of(context).pop();
                _submitForm();
                _showAcceptionDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAcceptionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form gönderildi'),
          content: Text('Formunuz başarıyla gönderildi.'),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    final bool isDesktop = MediaQuery
        .of(context)
        .size
        .width >= 1000;
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
          body: Stack(fit: StackFit.expand, children: [
            Positioned.fill(
              child: Image.asset(
                'android/assets/arkaplan.png', // Arka plan resminizin yolu
                fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde ölçekle
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    constraints: BoxConstraints(maxWidth: 650),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF069BBF).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Text(
                      "İlk bölümü bitirdiniz. Buraya kadar devam ettiğiniz ve etkinlikleri yaptığınız için kendinizi tebrik"
                          "edebilirsiniz."
                          "Bu sayfada bitirmiş olduğunuz bu bölümü değerlendirmenizi istiyorum. Aşağıdaki sorular"
                          "doğrultusunda değerlendirmenizi yapınız.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Sayfanın kaydırılabilir kısmı için boşluk
                  _buildQuestionContainer(
                    "Bu bölümü okurken dikkatinizi en çok ne çekti? Sizin yaşadıklarınızla buradaki anlatılar benziyor mu? Benziyor ise neresi benziyor?",
                    _controller1,
                  ),
                  SizedBox(height: 30),
                  _buildQuestionContainer(
                    "Bu bölümü okurken dikkatinizi en çok ne çekti? Sizin yaşadıklarınızla buradaki anlatılar benziyor mu? Benziyor ise neresi benziyor?",
                    _controller2,
                  ),
                  SizedBox(height: 30),
                  _buildQuestionContainer(
                    "Bu bölümde öğrendiklerinizi kısaca belirtiniz. Bir kaç cümle ya da anahtar kelimelerle belirtebilirsiniz.",
                    _controller3,
                  ),
                  SizedBox(height: 30),
                  _buildQuestionContainer(
                    "Sormak istediğiniz sorular varsa aşağıya yazınız. Aklınıza her ne takılırsa mutlaka sorun.",
                    _controller4,
                  ),
                  SizedBox(height: 30),
                  _buildOptionContainer(
                    "Bu bölüm üzerinde ne kadar çalıştınız?",
                    ['0-15 dk', '15-30 dk', '30-60 dk', '1-3 saat', '3-5 saat'],
                  ),
                  ElevatedButton(
                    onPressed: _showConfirmationDialog,
                    child: Text('Gönder'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Butonun arka plan rengi
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ]
          )
      );
    }

Widget _buildQuestionContainer(String question,
    TextEditingController controller) {
  return Container(
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
          question,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 30),
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

Widget _buildOptionContainer(String question, List<String> options) {
  // Ekran genişliğini ölç
  final screenWidth = MediaQuery
      .of(context)
      .size
      .width;

  // Ekran genişliğine göre boşluk ayarla
  final dynamicSpacing = screenWidth * 0.0237; // Ekranın %2'si kadar boşluk

  return Container(
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
          question,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: dynamicSpacing, // Dinamik boşluk burada kullanılıyor
          children: options.map((option) {
            return ChoiceChip(
              label: Text(option),
              selected: _selectedOption == option,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _selectedOption = option;
                  } else {
                    _selectedOption = '';
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    ),
  );
}
}
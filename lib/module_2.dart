import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'module_1.dart';
import 'module_3.dart';
import 'module_table.dart';
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
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const Mtable(),
        '/M3': (context) => const M3Page(),
        '/M0': (context) => const Mtable(),
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

  void _submitForm() {
    for (var controller in _textControllers) {
      print(controller.text); // Terminale yazdırma
      controller.clear(); // Textbox'ı temizleme
    }
    Navigator.pushReplacementNamed(context, '/M3'); // /M3 sayfasına yönlendirme
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
            ? const Text('1. Bölüm 2. Sayfa')
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
                '1. Bölüm 2. Sayfa', style: TextStyle(color: Colors.white)),
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
      body :Stack(
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
                      "Hepimiz zaman zaman Ayşe ya da Efe gibi zor dönemler geçirebiliriz. Fakat bu süre"
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20), // Sabit metin ve form arasında boşluk
                  Container(
                    constraints: BoxConstraints(maxWidth: 650),
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
                  SizedBox(height: 20), // Butonun altında boşluk
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
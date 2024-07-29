import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:photo_view/photo_view.dart';
import 'home_page.dart';
import 'module_4.dart';
import 'module_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const M3Page(),
      routes: {
        '/Home': (context) => const HomePage(),
        '/M0': (context) => const Mtable(),
        '/M4': (context) => const M4Page(),
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
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Modül 3'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home'); // Ana sayfaya yönlendirme
            },
          ),
        ],
      ),
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
                      Navigator.pushNamed(context, '/M0');
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

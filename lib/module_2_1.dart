import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'home_page.dart';
import 'login.dart';
import 'module_1_1.dart';
import 'module_1_2.dart';
import 'module_1_3.dart';
import 'module_1_4.dart';
import 'module_1_5.dart';
import 'module_1_6.dart';
import 'module_1_6v1.dart';
import 'module_1_6v2.dart';
import 'module_1_7.dart';
import 'module_2_2.dart';
import 'module_2_3.dart';
import 'module_2_4.dart';
import 'module_2_5.dart';
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'self_help.dart';
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
        '/M21': (context)=> const M2_1Page(),
        '/M22': (context) => const M2_2Page(),
        '/M23': (context) => const M2_3Page(),
        '/M24': (context) => const M2_4Page(),
        '/M25': (context) =>  M2_5Page(),
        '/SH' : ( context)=> SelfhelpPage(),
        '/M61': (context) => const M6v1Page(),
        '/M62': (context) => const M6v2Page(),
      },
    );
  }
}

class M2_1Page extends StatefulWidget {
  const M2_1Page({super.key});

  @override
  State<M2_1Page> createState() => _M2_1PageState();
}

class _M2_1PageState extends State<M2_1Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'ZekPqK8ifyE', // Buraya kendi YouTube video ID'nizi ekleyin
      params: const YoutubePlayerParams(
        autoPlay: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.close();
    super.dispose();
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
              backgroundDecoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    String text = _textController.text;
    print(text);
    _textController.clear();
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
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    "Bu bölüme kendindelik egzersizi ile başlamak istiyoruz. Kendindelik egzersizini olduğunuz"
                    "yerde olmak adına kendinizi eğitmenin bir yolu olarak düşünebilirsiniz. Bu ve benzer"
                  "alıştırmaların belirli amacı bulunmaktadır; Aklınıza gelen düşünceler ve hissettiğiniz duygular"
                  "sizi ya geçmişe ya da geleceğe götürmeye çalışacaktır bu egzersizle bu eğilimlere karşı"
                  "koyabilecek bulunduğunuz an’a geri dönmeyi öğrenebileceksiniz. Bu uygulamayı yapmanın"
                  "doğru ya da yanlış bir yolu yok sadece elinizden geldiğince takip edin. Tek yapmanız"
                    "gereken, beş dakika boyunca rahatsız edilmeyeceğiniz rahat bir pozisyona geçmek."
                  "İsterseniz aşağıdaki metni bir kere okuduktan sonra egzersizi kendiniz gerçekleştirebilir ya"
                  "da yan tarafta bulunana karekod yardımıyla ses dosyasına gidebilir ve o ses yardımıyla"
                  "egzersizi gerçekleştirebilirsiniz. Eğer metni okuyarak devam edeceksiniz kendinize 5 dakika"
                  "ayırın bir sandalyede oturun. Zamana dikkat etmek zorunda kalmamak için 5 dakikalık bir"
                  "alarm işinize yarayabilir.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:
                  YoutubePlayerIFrame(
                    controller: _youtubeController,
                    aspectRatio: 16 / 9,
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    "Şimdi size bir önceki bölümde verilen egzersizi çıkarınız ve doldurduğunuz çalışma"
                   "kağıdına göz gezdiriniz. Bu tablo size, sizinle ilgili ne söylüyor?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mesajınızı buraya yazın',
                      fillColor: Colors.white, // İç rengi beyaz
                      filled: true, // Doldurulmuş olmalı
                    ),
                    onSubmitted: (value) {
                      _submitForm();
                    },
                  ),
                ),
                // "Devam Et" butonu
                SizedBox(height: 30),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    "Duygularınızı ve düşüncelerinizi kontrol etmeye çalıştınız mı? Kontrol yöntemlerini"
                  "kullandıysanız eğer nasıl sonuçlar elde ettiniz?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mesajınızı buraya yazın',
                      fillColor: Colors.white, // İç rengi beyaz
                      filled: true, // Doldurulmuş olmalı
                    ),
                    onSubmitted: (value) {
                      _submitForm();
                    },
                  ),
                ),
                // "Devam Et" butonu
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/M22');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Butonun arka plan rengi
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Devam Et'),
                ),
                SizedBox(height: 20,)
              ],
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

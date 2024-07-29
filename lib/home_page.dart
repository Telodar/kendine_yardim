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

void main() {
  runApp(const MyApp());
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
      home: const HomePage(),
      routes: {
        '/Login': (context) => LoginPage(),
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
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Row(
          children: [
            Image.asset(
              'android/assets/goplogo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            SizedBox(width: 8),
            Text('Kendine Yardım'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login');
            },
            child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3D1953).withOpacity(0.5),
              ),
              child: Text(
                'Gazi Osman Paşa Üniversitesi Kendine Yardım Portalı',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pushNamed(context, '/M1');
              },
            ),
            ListTile(
              leading: Icon(Icons.view_module),
              title: Text('Modüller'),
              onTap: () {
                Navigator.pushNamed(context, '/M1');
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mesajlar'),
              onTap: () {
                Navigator.pushNamed(context, '/M3');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'android/assets/arkaplan.png',
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Image.asset(
                        'android/assets/goplogo.png',
                        height: 250, // Logo boyutunu ayarlayın
                      ),
                    ),
                    SizedBox(height: 30), // Logo ve metin kutusu arasındaki boşluk
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: 650, // Metin kutusunun genişliğini sınırlayabilirsiniz
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kendi Kendine Yardım Nedir?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'İnsanoğlu hayatı boyunca karşılaştığı farklı yaşam zorluklarıyla mücadele etmektedir. Çeşitli yaşam zorluklarıyla başa çıkabilmenin farklı yolları vardır, bunlardan en yaygını/önemlisi profesyonel bir yardım almaktır. Bu yardım içerisinde ilaçla tedavi ve psikoterapiler yer almaktadır. Bunların dışında yardım almanın önemli bir yolu da kendi kendine yardımdır.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Kendi Kendine Yardım',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Kendi kendine yardım, kitaplar, kılavuzlar, ses dosyaları, videolar ve ya bu formatların bazı kombinasyonlarını kullanarak kişinin kendisi tarafından yürütülen yardım türüdür (Gould ve Clum, 1993). Kişinin bu süreci tamamlaması için uzmanla temas şart değildir: fakat bu çalışmak kapsamında bir uzman destekleyici ve kolaylaştırıcı olmak amacıyla sizinle haftalık olarak mail ya da telefonla iletişim sağlayacaktır.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Bu Kılavuzdan Nasıl Yararlanacağım?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bu kılavuz Kabul ve Kararlılık Terapisi (KKT) ilke, yöntem ve tekniklerine dayalı olarak hazırlanmıştır. Kılavuz içerisinde depresif duygu durum, kaygı ve stres sorunlarında etkili olduğu daha önce kanıtlanmış yöntem ve teknikleri barındırmaktadır.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Kılavuz İçeriği',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bu kılavuz, içerisindeki bilgileri sadece okuyup geçebileceğiniz bir kılavuz değildir: aksine içerisinde yer alan alıştırmaları ve egzersizleri o an ve sonrasında günlük hayatınızda gerçekleştireceğiniz bir yol arkadaşıdır. Bu süreç aslında bir enstrüman çalmayı öğrenmek gibidir. Nasıl bir gitarın çalınacağını okuyarak ya da birinin bize anlatması ile öğrenemiyor ve egzersiz yapmaya ihtiyaç duyuyorsak, burada da notaları birlikte öğrenerek ve egzersiz sayesinde gitar çalmaya başlayabilirsiniz.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Alıştırmalar',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Buradaki alıştırmaları gerçekleştirebilmeniz için şartları olabildiğince sizin açınızdan daha rahat uygulanabilir hale getirmeye çalışıyoruz. Bazı alıştırmaların içerisinde karekodlar göreceksiniz ve bu karekodlar sizi alıştırmanın sesli dosyasına ulaştırmak içindir. O karekod sayesinde alıştırmayı sesli dinleyerek gerçekleştirebilirsiniz.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Zorluklar ve Kolaylaştırıcılar',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Başlangıçta bu alıştırmaları gerçekleştirmek bazılarımız için zorlayıcı olabilir fakat bu alıştırmaları yapmaya devam ettikçe uygulamanın kolaylaştığını fark edebilirsiniz.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Hatırlatma',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bu kitaptaki kavramlar ve stratejiler kişisel gelişiminize yardımcı olabilse de bu kitabın tıbbi tavsiye içermediğini ve psikoterapi ve ya tıbbi tedavinin yerini alma amacı taşımadığını hatırlatmak istiyoruz. Eğer yaşadığınız durumun daha ciddi düzeyde olduğunu düşünüyorsanız bir ruh sağlığı uzmanına başvurunuz.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
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

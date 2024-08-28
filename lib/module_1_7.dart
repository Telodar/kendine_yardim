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
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'signupPage.dart';
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

class M7Page extends StatefulWidget {
  const M7Page({super.key});

  @override
  State<M7Page> createState() => _M7PageState();
}

class _M7PageState extends State<M7Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'Z7NURMFq99o', // Buraya kendi YouTube video ID'nizi ekleyin
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
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF069BBF).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    "Şimdi bu bölümü bir kendindelik egzersizi ile bitirmek istiyoruz. İsterseniz aşağıdaki "
                        "metni bir kere okuduktan sonra egzersizi kendiniz gerçekleştirebilir ya da yan tarafta "
                        "bulunana karekod yardımıyla ses dosyasına gidebilir ve o ses yardımıyla egzersizi "
                        "gerçekleştirebilirsiniz.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF069BBF).withOpacity(0.8),
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
                    color: Color(0xFF069BBF).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    "Lütfen aşağıdaki metni size aşina gelene kadar okuyun ve daha sonra yönergeleri"
                        "kendinize göre uygulayın. Her üç noktada (...) kendinize 5 ila 10 saniye zaman tanıyın."
                        "Gövdeniz dik ve ayaklarınız yerle temas edecek şekilde sandalyenize oturun. Gözlerinizi"
                        "kapatın, eğer gözlerinizi kapatmak istemezseniz sabit bir nokta seçerek bakışlarınızı o"
                        "noktaya odaklayın ve tüm dikkatinizi nefesinize verin."
                        "Vücudunuzdaki tüm hücreler nefes alırmışçasına derin bir nefes alın ve şimdi aldığınız"
                        "hızda yavaşça nefesinizi verin. Normal ritminize dönerken nefes alış verişinizi izleyin..."
                        "Havanın burun deliklerinizden geçerek akciğerlerinizi doldurduğunu ve tekrar"
                        "vücudunuzu terk ettiğini hissedin. Nefes alın ve verin..."
                        "Normal ritminizde nefes alıp vermeye devam ederken göğsünüzün ve karnınızın yukarı ve"
                        "aşağı hareketini takip edin... Nefes alın ve verin... Bu ritmin farkına varın ve nefesinizi"
                        "izleyin..."
                        "Bu esnada dikkatiniz dağılabilir; zihninize farklı düşünceler, hayaller gelebilir. Eğer bunu"
                        "fark ederseniz fark ettiğiniz için kendinizi tebrik edin ve yeniden nefesinize odaklanın."
                        "Nefesinizi verirken burun deliklerinizden geçen havanın daha sıcak, alırken daha soğuk"
                        "olduğunu fark edin... Nefes alın ve verin..."
                        "Nefes alıp verirken bir yandan da bu esnada çıkan sesi fark edin... Nefes alın ve verin..."
                        "Havanın burnunuzdan girerken ve çıkarken ortaya çıkardığı sesi fark edin, izleyin..."
                        "Şimdi bulunduğunuz ortamdaki sesleri dinleyin, fark edebildiğiniz kadar çok ses fark"
                        "edin... Hiçbir ses diğerinden daha önemli değil. Eğer dikkatiniz içlerinden birine daha"
                        "fazla odaklanırsa bunu fark ettiğiniz için kendinizi tebrik edin ve yeniden tüm sesleri fark"
                        "edin..."
                        "Şimdi bedeninize odaklanın...Duruşunuzu fark edin...Vücudunuzun sandalyeyle temas"
                        "eden kısımlarını hissedin... Vücudunuzun ağırlığını fark edin."
                        "Vücudunuza temas eden kıyafetinizi hissedin... Elinizin altındaki kumaşın dokusunu fark"
                        "edin... Neye benziyor? Pürüzlü mü, düz mü, yumuşak mı, sert mi... bunları fark edin..."
                        "Şimdi eğer kapalıysa gözlerinizi açın ve görüş alanınıza giren tüm nesneleri fark edin..."
                        "Unutmayın hiç bir nesne diğerinden daha önemli değil. Yine bir nesne diğerlerinden daha"
                        "fazla dikkatinizi çekmiş olabilir, bunu fark ederseniz kendinizi tebrik edin ve yeniden tüm"
                        "nesnelere odaklanın..."
                        "Ve şimdi etrafınızdaki tüm duyumların farkına varın... Sesler, dokunduğunuz kumaş,"
                        "burun deliklerinizden giren hava, gördüğünüz nesneler... Hepsi eşit derecede öneme"
                        "sahip. Fark edebildiğiniz kadar çok duyumun farkına varın..."
                        "Hazır olduğunuzda egzersizi bitirebilirsiniz."
                        "Hazırlayan: Dr. Sevinç Ulusoy & Dr. Hüseyin Şehit Burhan",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                ),
                SizedBox(height: 20),
                // "Devam Et" butonu
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/M8');
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

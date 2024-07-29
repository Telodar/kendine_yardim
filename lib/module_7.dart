import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'login.dart';
import 'home_page.dart';
import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_5.dart';
import 'module_6.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: const M7Page(),
      routes: {
        '/Home': (context) => const HomePage(),
        '/Login': (context) => const LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => const M2Page(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
        '/M5': (context) => const M5Page(),
        '/M6': (context) => const M6Page(),
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
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: const Text('Modül 7'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
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
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 650),
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
                    constraints: BoxConstraints(maxWidth: 650),
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
                  constraints: BoxConstraints(maxWidth: 650),
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
                    Navigator.pushNamed(context, '/M8');
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

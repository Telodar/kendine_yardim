import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:photo_view/photo_view.dart';
import 'login.dart';
import 'home_page.dart';
import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_5.dart';
import 'module_7.dart';

void main() {
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
      home: const M6Page(),
      routes: {
        '/Home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => const M2Page(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
        '/M5': (context) => const M5Page(),
        '/M7': (context) => const M7Page(),
      },
    );
  }
}

class M6Page extends StatefulWidget {
  const M6Page({super.key});

  @override
  State<M6Page> createState() => _M6PageState();
}

class _M6PageState extends State<M6Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();

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

  void _submitForm() {
    String text = _textController.text;
    print(text); // Terminale yazdırma
    _textController.clear(); // Textbox'ı temizleme
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Modül 6'),
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
            child: Column(
              children: [
                SizedBox(height: 20),
                // Sayfanın kaydırılabilir kısmı için boşluk
                // Diğer içerikler buraya eklenebilir
                Container(
                  constraints: BoxConstraints(maxWidth: 650),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF069BBF).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Yaşanılan bu durumu biraz daha somutlaştıralım."
                        "Ormanda gezintiye çıkan bir adam düşünün, yeşillikler içerisinde etrafı izleyerek yürürken bir"
                        "anda fark etmeden bataklığın içine düşer. Hemen bataklıktan kurtulmak için bazı hareketler "
                        "yapar fakat her hareketinde biraz daha bataklığın içine batmaya başlar. Bataklıktan "
                        "kurtulmanın tek bir yolu vardır; o da sırt üstü yatıp bütün vücudunu bırakarak yüzeyde "
                        "durmaktır. Tüm vücudun kurtulmak için bir şeyler yapman gerektiğini mücadele etmen "
                        "gerektiğini söylüyor daha az çaba gerektiren sırtüstü yatmak sanki bir tuzak görünüyor. Ama "
                        "bilinen bir gerçek var ki buradan kurtulmak için yaptıkların seni daha derine batırıyor.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                // Metin ile resim arasında 20 piksel boşluk
                Container(
                  constraints: BoxConstraints(maxWidth: 650),
                  child: GestureDetector(
                    onTap: () =>
                        _showPhoto(context, 'android/assets/module6.png'),
                    child: Image.asset(
                      'android/assets/module6.png',
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
                    "Sizin durumunuz buradaki adama benziyor mu? Çıkmak için yaptıklarınız sizi bataklıktan "
                        "çıkarıyor mu yoksa daha derine mi götürüyor?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                    "Bir de süreci daha iyi anlayabilmek için uçurumun kenarındaki canavara bakalım."
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                // Metin ile resim arasında 20 piksel boşluk
                Container(
                  constraints: BoxConstraints(maxWidth: 650),
                  child: GestureDetector(
                    onTap: () =>
                        _showPhoto(context, 'android/assets/module6_1.png'),
                    child: Image.asset(
                      'android/assets/module6_1.png',
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
                    "Peki ya halatı bırakırsanız ne olur?"
                        "Canavarı görmeye devam edebilir, sesini duyabilir onun orda olduğunu bilebilirsiniz ama o"
                        "sizi o uçurumdan aşağı düşüremez sadece oradan bağırabilir ve elinden de başka bir şey"
                        "gelmez."
                        "Sizi rahatsız eden duygu ve düşüncelerden oluşan bu canavara karşı halatı bırakmaya ne"
                        "dersiniz?"
                        "Eğer bu durum yaşadıklarınıza benziyorsa sizi rahatsız eden duygu ve düşünceleri"
                        "kontrol/mücadele etmeden hayatı olduğu gibi deneyimlemeye açık mısınız? Bunu nasıl"
                        "yapabileceğinizi bu süreçte öğrenmek ister misiniz?"
                        "Eğer cevabınız evetse öncelikle bu hafta hayatınızda kontrol yöntemlerini ne kadar sıklıkla"
                        "kullandığınızı keşfedelim. Ayrıca bu süreçte neler yapabileceğinize birlikte bakacağız.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                // "Devam Et" butonu
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/M7');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Butonun arka plan rengi
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Devam Et'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

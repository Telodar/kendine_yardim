import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: M2_5Page(),
    );
  }
}

class M2_5Page extends StatefulWidget {
  @override
  _M2_5PageState createState() => _M2_5PageState();
}

class _M2_5PageState extends State<M2_5Page> {
  final _formKey = GlobalKey<FormState>();
  final List<String> questions = [
    'Bu değerleri sıralamaya çalışmak sizin için nasıldı? Bunu yaparken ne düşündünüz veya hissettiniz?',
    'Değerleri Çok önemli – Önemli– Çok önemli değil diye nasıl ayırdınız? Bunu neye göre yaptınız?',
    'Hayatınızda neyi önemli kılmayı seçeceğinizi bilmek sizin için nasıldı?',
    'Çok önemli 10 değeri seçerken ne düşündünüz ve nasıl hissettiniz?',
  ];

  final Map<String, TextEditingController> textControllers = {};

  @override
  void initState() {
    super.initState();
    for (var question in questions) {
      textControllers[question] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      textControllers.forEach((key, controller) {
        print('$key: ${controller.text}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Form'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Önceki sayfayı doldururken verdiğiniz kararlara göre cevaplayınız.",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        for (var question in questions)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: textControllers[question],
                              decoration: InputDecoration(
                                labelText: question,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen bu alanı doldurun';
                                }
                                return null;
                              },
                              maxLines: 3,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Yaşam Alanı ve Değerler',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Sizinle bu hayatta nasıl biri olmak istediğiniz, hayatınızı nasıl devam ettirmek istediğinizle ilgili ön plana çıkan değerleri belirlemiş olduk. "
                              "Aşağıda 9 tane farklı yaşam alanı bulunmaktadır ve bu yaşam alanları bazıları için daha ön plana çıkarken bazıları için daha arka plandadır. "
                              "Şimdi sizin için önemli olduğunu düşündüğünüz bu yaşam alanlarına yukardaki belirlediğiniz değerlerden hangilerini uygulamak istiyorsanız bunu yaşam alanının "
                              "yanındaki boşluğa yazınız.",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        _buildValuesTable(context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Gönder'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValuesTable(BuildContext context) {
    final List<String> lifeAreas = [
      'Çift/ yakın ilişkiler',
      'Aile ilişkileri',
      'Arkadaşlık/ sosyal ilişkiler',
      'Kariyer',
      'Eğitim/kişisel gelişim',
      'Eğlence/boş vakit',
      'Sağlıklı Bedensel gelişim',
      'Maneviyat',
      'Toplum hayatı',
      'Çevre ve Doğa',
    ];

    return Column(
      children: lifeAreas
          .map(
            (lifeArea) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  lifeArea,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bu alanı doldurun';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}

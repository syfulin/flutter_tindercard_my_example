import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main() {
  runApp(MyApp());
}

// Виджет-приложение
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder swiper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: Tinderswiper(),
    );
  }
}

// Основной виджет
class Tinderswiper extends StatefulWidget {
  @override
  _TinderswiperState createState() => _TinderswiperState();
}

// Узнать, зачем здесь mixin TickerProviderStateMixin
class _TinderswiperState extends State<Tinderswiper>
    with TickerProviderStateMixin {
  // Список картинок
  List<String> galleryImages = [
    'assets/images/k1.png',
    'assets/images/k2.png',
    'assets/images/k3.png',
    'assets/images/k4.png',
    'assets/images/k5.png',
    'assets/images/k6.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tinder swiper'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            orientation: AmassOrientation.TOP,
            totalNum: galleryImages.length, // количество картинок
            stackNum: 5, // Номер начальной картинки ?
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.height * 0.8,
            cardBuilder: (context, index) => Card(
                elevation: 0, // Убрать тень, что бы карточка была прозрачной
                color: Colors.transparent, // Прозрачный цвет карточки
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    '${galleryImages[index]}',
                    fit: BoxFit.fill,
                  ), // Внутри карточки уже сама картинка
                )), // ClipRRect - Штука для закругления её child'a
          ),
        ),
      ),
    );
  }
}

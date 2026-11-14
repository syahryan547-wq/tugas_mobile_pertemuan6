import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> travelData = [
  {
    'nama': 'Raja ampat',
    'gambar':
        'https://th.bing.com/th/id/OIP.GAv9GMFy0aazWVh2YhebugHaEo?w=290&h=181&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'lokasi': 'papua',
    'deskripsi':
        'Raja Ampat adalah gugusan pulau di Papua Barat Daya yang terkenal dengan laut biru jernih, terumbu karang, dan keanekaragaman hayati lautnya.',
  },
  {
    'nama': 'Candi borobudur',
    'gambar':
        'https://th.bing.com/th/id/OIP.IOsGB2dE73_ZjEnzyBtTrQHaE8?w=328&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'lokasi': 'Jawa tengah',
    'deskripsi':
        'Candi Borobudur adalah candi Buddha abad ke-9 di Magelang, Jawa Tengah, dan termasuk Situs Warisan Dunia UNESCO.',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'katalog wisata',
      debugShowCheckedModeBanner: false,
      home: Homepage(travelData: travelData),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
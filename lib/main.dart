import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salat App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SalatList(),
    );
  }
}

class Salat {
  final String name;
  final int price;
  final String kcal;

  Salat({required this.name, required this.price, required this.kcal});
}

class SalatList extends StatelessWidget {
  final List<Salat> salatList = [
    Salat(name: "Stolicniy", price: 3, kcal: "350"),
    Salat(name: "Pomidor-Xiyar", price: 2, kcal: "50"),
    Salat(name: "Kiyevskiy", price: 5, kcal: "400"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salat Menyu'),
      ),
      body: ListView.builder(
        itemCount: salatList.length,
        itemBuilder: (context, index) {
          final salat = salatList[index];
          return ListTile(
            title: Text(salat.name),
            subtitle: Text(
                'Qiymet: ${salat.price} manat | Kalori: ${salat.kcal} kcal'),
            trailing: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Tesekkurler!'),
                      content:
                          Text('Sizin istediyiniz ${salat.name} hazirlanir.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Bagla'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Sifaris et'),
            ),
          );
        },
      ),
    );
  }
}

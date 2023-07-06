import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrimaGanjil extends StatefulWidget {
  const PrimaGanjil({super.key});

  @override
  State<PrimaGanjil> createState() => _PrimaGanjilState();
}

class _PrimaGanjilState extends State<PrimaGanjil> {
  int angka = 0;

  void tekanAku() {
    setState(() {
      angka = (angka + 1) % 46; // Memastikan angka tetap dalam rentang 0-45
    });
  }

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    if (number <= 3) {
      return true;
    }
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  bool isPrimeAndOdd(int number) {
    return isPrime(number) && number % 2 != 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz 1 dan UTS PAPB',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: tekanAku,
          child: Icon(Icons.add_circle_outline),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Saiful Rizal - Nomor Absen Genap (20104410067)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Angka: $angka',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: isPrimeAndOdd(angka)
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              Text(
                'Angka $angka adalah bilangan prima yang ganjil? ${isPrimeAndOdd(angka)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

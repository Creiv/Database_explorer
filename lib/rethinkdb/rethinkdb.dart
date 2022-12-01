import 'package:flutter/material.dart';

class Rethinkdb extends StatefulWidget {
  const Rethinkdb({super.key});

  @override
  State<Rethinkdb> createState() => _RethinkdbState();
}

class _RethinkdbState extends State<Rethinkdb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RethinkDB'),
        backgroundColor: Colors.blueGrey[900],
      ),
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class RethinkDB extends StatefulWidget {
  final String ip;
  final int port;
  final user;
  final pass;
  const RethinkDB({super.key, required this.ip, required this.port, this.user,  this.pass});
  
  @override
  State<RethinkDB> createState() => _RethinkDBState();
  
}

class _RethinkDBState extends State<RethinkDB> {
  
  RethinkDb r = RethinkDb();
  
  var conn;
  Future _connect() async {
    if(widget.user.isEmpty){
      conn = await r.connect(
      host: widget.ip,
      port: widget.port
    );
    }else{
      conn = await r.connect(
      host: widget.ip,
      port: widget.port,
      user: widget.user,
      password: widget.pass,
    );
    }
    return conn;
  }
  
  @override
  void initState() {
    super.initState();
    _connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RethinkDB'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "RethinkDB",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: _connect(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return const Text('Connected');
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
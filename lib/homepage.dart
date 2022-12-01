import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dbexpl/rethinkdb/rethinkdb.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ip = TextEditingController();
  final TextEditingController _port = TextEditingController();
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final List<String> items = [
    'RethinkDB',
    'Firebase',
    'Others ...',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Enter the information to connect to the database",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: _ip,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.computer_rounded),
                    border: OutlineInputBorder(),
                    labelText: 'Host',
                    hintText: 'IP xxx.xxx.xxx.xxx',
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter the IP address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _port,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.door_back_door_rounded),
                    border: OutlineInputBorder(),
                    labelText: 'Port',
                    hintText: '29015',
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter the IP address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 165,
                      child: TextFormField(
                        controller: _user,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'User',
                          hintText: 'Admin',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter the IP address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 165,
                      child: TextFormField(
                        controller: _pass,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Pass',
                          hintText: '**********',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter the IP address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomDropdownButton2(
                  icon: const Icon(Icons.all_inbox),
                  iconSize: 25,
                  hint: 'Database',
                  dropdownItems: items,
                  value: selectedValue,
                  buttonWidth: double.infinity,
                  buttonHeight: 60,
                  buttonDecoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                    
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(175, 35),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Connetti'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

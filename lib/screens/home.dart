// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(
                            context, '/selectLocation');
                        if (result != null) {
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDaytime': result['isDaytime'],
                              'flag': result['flag']
                            };
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.edit_location,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Edit Location",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.white),
                      )),
                  const SizedBox(height: 30),
                  Text(
                    data['location'],
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    data['time'],
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

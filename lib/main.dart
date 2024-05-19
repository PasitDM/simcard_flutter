import 'package:flutter/material.dart';
import 'package:sim_card_flutter/sim_card_info_screen.dart';
import 'package:sim_card_flutter/sim_number_screen.dart';

import 'sim_data_plus_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimNumberScreen(),
                    ),
                  );
                },
                child: const Text('Go to Lib simnumber screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimDataPlusScreen(),
                    ),
                  );
                },
                child: const Text('Go to Lib sim_data_plus screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimDataPlusScreen(),
                    ),
                  );
                },
                child: const Text('Go to Lib mobile_number screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimCardInfoScreen(),
                    ),
                  );
                },
                child: const Text('Go to Lib sim_card_info screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sim_card_flutter/mobile_number_screen.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildContent(
              context,
              topic: 'simnumber 0.0.12',
              dateTxt: 'Jul 29, 2022',
              btnTxt: 'simnumber',
              canIos: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimNumberScreen(),
                  ),
                );
              },
            ),
            buildContent(
              context,
              topic: 'sim_data_plus 0.1.4',
              dateTxt: 'Aug 26, 2022',
              btnTxt: 'sim_data_plus',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimDataPlusScreen(),
                  ),
                );
              },
            ),
            buildContent(
              context,
              topic: 'mobile_number 2.1.1',
              dateTxt: 'Oct 11, 2022',
              btnTxt: 'mobile_number',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileNumberScreen(),
                  ),
                );
              },
            ),
            buildContent(
              context,
              topic: 'sim_card_info 1.0.2',
              dateTxt: 'Apr 24, 2024',
              btnTxt: 'sim_card_info',
              canIos: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimCardInfoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column buildContent(
    BuildContext context, {
    required String topic,
    required String dateTxt,
    required String btnTxt,
    required Function() onTap,
    bool canAndroid = true,
    bool canIos = false,
  }) {
    return Column(
      children: [
        Text(
          topic,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text('Last updated: $dateTxt'),
        ElevatedButton(
          onPressed: onTap,
          child: Text('Go to Lib $btnTxt screen'),
        ),
        Text('Platform: ${canAndroid ? 'Android' : ''}${canIos ? ',iOS' : ''}'),
        const Divider(height: 20),
      ],
    );
  }
}

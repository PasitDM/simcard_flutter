import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simnumber/sim_number.dart';
import 'package:simnumber/siminfo.dart';

class SimNumberScreen extends StatefulWidget {
  const SimNumberScreen({super.key});

  @override
  State<SimNumberScreen> createState() => _SimNumberScreenState();
}

class _SimNumberScreenState extends State<SimNumberScreen> {
  SimInfo simInfo = SimInfo([]);

  @override
  void initState() {
    super.initState();
    SimNumber.listenPhonePermission((isPermissionGranted) {
      print("isPermissionGranted : " + isPermissionGranted.toString());
      if (isPermissionGranted) {
        initPlatformState();
      } else {}
    });
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      simInfo = await SimNumber.getSimData();
      setState(() {});
    } on PlatformException {
      print("simInfo  : " + "2");
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: simInfo.cards.isEmpty
            ? const Text("No SIM Card Found")
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: simInfo.cards
                      .map((e) => Text("SIM ${e.slotIndex} - ${e.phoneNumber}"))
                      .toList(),
                ),
              ),
      ),
    );
  }
}

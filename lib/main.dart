import 'package:flutter/material.dart';

void main() {
  runApp(const HeartMonitoringApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart Monitoring App',
      home: HeartMonitoringApp(),
    );
  }
}

class HeartMonitoringApp extends StatefulWidget {
  const HeartMonitoringApp({super.key});

  @override
  _HeartMonitoringAppState createState() => _HeartMonitoringAppState();
}

class _HeartMonitoringAppState extends State<HeartMonitoringApp> {
  int heartRate = 75;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Heart Monitoring App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Heart Rate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '$heartRate BPM',
                key: const Key('heartRateText'),
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    heartRate = _generateRandomHeartRate();
                  });
                },
                child: Text('Generate Random Heart Rate'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _generateRandomHeartRate() {
    //Simulate random heart rate between 60 and 100 BPM
    return 60 + (DateTime.now().microsecondsSinceEpoch % 40);
  }
}

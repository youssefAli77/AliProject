import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Units Converter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: UnitConverterHome(),
    );
  }
}

class UnitConverterHome extends StatefulWidget {
  @override
  _UnitConverterHomeState createState() => _UnitConverterHomeState();
}

class _UnitConverterHomeState extends State<UnitConverterHome> {
  final _tempController = TextEditingController();
  final _distanceController = TextEditingController();

  String _tempResult = '';
  String _distanceResult = '';

  void _convertTemp() {
    double fahrenheit = double.tryParse(_tempController.text) ?? 0;
    double celsius = (fahrenheit - 32) * 5 / 9;
    setState(() {
      _tempResult = '${celsius.toStringAsFixed(2)} °C';
    });
  }

  // void _convertTemp() {
  //   if (_tempController.text.trim().isEmpty) {
  //     setState(() {
  //       _tempResult = 'Please enter a valid temperature.';
  //     });
  //     return;
  //   }
  //
  //   double? fahrenheit = double.tryParse(_tempController.text);
  //   if (fahrenheit == null) {
  //     setState(() {
  //       _tempResult = 'Invalid input. Please enter a number.';
  //     });
  //     return;
  //   }
  //
  //   double celsius = (fahrenheit - 32) * 5 / 9;
  //   setState(() {
  //     _tempResult = '${celsius.toStringAsFixed(2)} °C';
  //   });
  // }

  void _convertDistance() {
    double miles = double.tryParse(_distanceController.text) ?? 0;
    double kilometers = miles * 1.60934;
    setState(() {
      _distanceResult = '${kilometers.toStringAsFixed(2)} km';
    });
  }

  @override
  void dispose() {
    _tempController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Units Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Temperature (°F to °C)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter temperature in °F',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _convertTemp,
              child: Text('Convert to Celsius'),
            ),
            Text(
              _tempResult,
              style: TextStyle(fontSize: 16, color: Colors.deepOrange),
            ),
            Divider(height: 32, thickness: 1),
            Text(
              'Distance (Miles to Kilometers)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _distanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter distance in miles',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _convertDistance,
              child: Text('Convert to Kilometers'),
            ),
            Text(
              _distanceResult,
              style: TextStyle(fontSize: 16, color: Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  List<String> cities = [
    "Halifax",
    "Toronto",
    "Vancouver",
    "New York",
    "Los Angeles",
    "Chicago",
    "Phoenix"
  ];

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/homepage");
              },
              icon: Icon(Icons.chevron_left),
            ),
          ),
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Select Location",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Center(
                child: Text(cities[index]),
              ),
              leading: Icon(cities[index] == weatherProvider.cityName
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked),
              onTap: () => weatherProvider.selectCity(cities[index]),
            );
          },
        ));
  }
}

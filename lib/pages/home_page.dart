import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final weatherProvider =
          Provider.of<WeatherProvider>(context, listen: false);
      weatherProvider.getWeather(weatherProvider.cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
        appBar: _appBar(context, themeProvider),
        body: Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
          child: Center(
            child: weatherProvider.weather == null
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Title(
                          color: Colors.black,
                          child: Text(
                            weatherProvider.weather!.cityName,
                            style: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          )),
                      Image.network(
                        weatherProvider.weather!.icon,
                        width: 200,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        spacing: 10.0,
                        children: [
                          Text(
                            "${weatherProvider.weather!.temperature.toStringAsFixed(0)}°C",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Text(weatherProvider.weather!.description)
                        ],
                      ),
                      const SizedBox(
                        width: 100,
                        child: Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 3,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.accessibility),
                                Text("Feels Like"),
                                Text(
                                    "${weatherProvider.weather!.feelsLike.toStringAsFixed(0)}°C")
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                Icon(Icons.air),
                                Text("Wind"),
                                Text(
                                    "${(weatherProvider.weather!.wind * 3.6).toStringAsFixed(2)} km/hr")
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                Icon(Icons.wb_twighlight),
                                Text("Humidity"),
                                Text("${weatherProvider.weather!.humidity}%"),
                              ],
                            )
                          ])
                    ],
                  ),
          ),
        ));
  }

  AppBar _appBar(BuildContext context, ThemeProvider themeProvider) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/locationpage");
          },
          icon: Icon(Icons.search),
        ),
      ),
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Weather App",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Switch(
              value: themeProvider.getIsSelected,
              onChanged: (value) {
                themeProvider.toggleThemeData();
              },
              activeColor: Colors.orange,
              thumbColor: MaterialStatePropertyAll(Colors.orange),
              inactiveThumbColor: Colors.transparent,
              trackColor: MaterialStatePropertyAll(Colors.transparent),
              activeTrackColor: Colors.transparent,
              trackOutlineColor: MaterialStatePropertyAll(Colors.black),
              thumbIcon: MaterialStatePropertyAll(themeProvider.getIsSelected
                  ? const Icon(Icons.nights_stay)
                  : const Icon(Icons.sunny))),
        )
      ],
    );
  }
}

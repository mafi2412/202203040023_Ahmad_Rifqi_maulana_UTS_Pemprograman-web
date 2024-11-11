import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Cuaca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrentWeather(),
            SizedBox(height: 20),
            Expanded(
              child: ForecastList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pekalongan',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Sunny',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        SizedBox(height: 10),
        Icon(
          Icons.wb_sunny,
          color: Colors.orange,
          size: 64,
        ),
        SizedBox(height: 10),
        Text(
          '30°C',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ForecastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ForecastItem(day: 'Senin', temperature: '28°C', icon: Icons.wb_cloudy),
        ForecastItem(day: 'Selasa', temperature: '30°C', icon: Icons.wb_sunny),
        ForecastItem(day: 'Rabu', temperature: '29°C', icon: Icons.wb_cloudy),
        ForecastItem(day: 'Kamis', temperature: '31°C', icon: Icons.wb_sunny),
        ForecastItem(day: 'Jumat', temperature: '27°C', icon: Icons.wb_cloudy),
        ForecastItem(day: 'Sabtu', temperature: '31°C', icon: Icons.wb_sunny),
        ForecastItem(day: 'Minggu', temperature: '27°C', icon: Icons.wb_cloudy),
      ],
    );
  }
}

class ForecastItem extends StatelessWidget {
  final String day;
  final String temperature;
  final IconData icon;

  ForecastItem(
      {required this.day, required this.temperature, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 32, color: Colors.blueAccent),
        title: Text(day),
        trailing: Text(temperature),
        onTap: () {
          // Navigasi ke halaman detail saat item ditekan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForecastDetailPage(
                day: day,
                temperature: temperature,
                icon: icon,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ForecastDetailPage extends StatelessWidget {
  final String day;
  final String temperature;
  final IconData icon;

  ForecastDetailPage(
      {required this.day, required this.temperature, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuaca Hari $day'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              '$day',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Suhu : $temperature',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Keadaan: Rodok panas lan Rendeng Bolo', // contoh deskripsi
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

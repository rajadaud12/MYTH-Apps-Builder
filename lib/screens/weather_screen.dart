import 'package:flutter/material.dart';
import 'package:simpleweather_app/utils/colors.dart'; 

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String locationName = 'New York';
  String country = 'USA';
  int temperature = 23;
  String weatherCondition = 'Sunny';
  int humidity = 65;
  int windSpeed = 12;
  int feelsLike = 25;
  int uvIndex = 6;
  int visibility = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 32),
                _buildMainWeather(),
                SizedBox(height: 32),
                _buildWeatherDetails(),
                SizedBox(height: 24),
                _buildForecastSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.white,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  locationName,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.white,
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              country,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.notifications_none,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildMainWeather() {
    return Column(
      children: [
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: AppColors.sunnyYellow.withOpacity(0.3),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.sunnyYellow.withOpacity(0.2),
                blurRadius: 40,
                spreadRadius: 20,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.wb_sunny,
              size: 100,
              color: AppColors.sunnyYellow,
            ),
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temperature.toString(),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 96,
                fontWeight: FontWeight.w300,
                height: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                '°C',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          weatherCondition,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'H:$feelsLike° L:${temperature - 5}°',
          style: TextStyle(
            color: AppColors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDetails() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDetailItem(Icons.water_drop_outlined, '$humidity%', 'Humidity'),
          _buildDetailItem(Icons.air, '$windSpeed km/h', 'Wind'),
          _buildDetailItem(Icons.wb_sunny_outlined, '$uvIndex', 'UV Index'),
          _buildDetailItem(Icons.visibility_outlined, '$visibility km', 'Visibility'),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 20,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: AppColors.white.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastSection() {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    List<int> temps = [22, 19, 24, 21, 25];
    List<IconData> icons = [
      Icons.wb_sunny,
      Icons.cloud,
      Icons.wb_sunny,
      Icons.cloud_queue,
      Icons.wb_sunny,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5-Day Forecast',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      icons[index],
                      color: AppColors.sunnyYellow,
                      size: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          '${temps[index] - 5}°',
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.6),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '${temps[index]}°',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
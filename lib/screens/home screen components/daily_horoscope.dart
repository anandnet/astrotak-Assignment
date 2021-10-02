import 'package:flutter/material.dart';
class DailyHoroScope extends StatelessWidget {
  const DailyHoroScope({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Daily Horoscope",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All >",
                    style: TextStyle(color: Color(0xFFF57F17)),
                  )
                ],
              ),
               Text(
                "Read your daily horoscope based on your sunsign,select your zodiac sign and give the right start toyour day",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700,height: 1.2,letterSpacing: 0.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  zodiacItem(
                      "assets/icons/aries.png", "Aries", "March 21-April 19"),
                  zodiacItem(
                      "assets/icons/taurus.png", "Taurus", "April 20-May 20"),
                  zodiacItem(
                      "assets/icons/gemini.png", "Gemini", "May 21-June 20"),
                ],
              ),
            ],
          ),
        );
  }
  Widget zodiacItem(String path, String name, String dateRange) {
    return SizedBox(
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(15, 0, 0, 255),
            child: Image.asset(
              path,
              height: 30,
              color: Colors.blue,
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            dateRange,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
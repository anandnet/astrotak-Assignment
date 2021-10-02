import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class TalkAstro extends StatelessWidget {
  const TalkAstro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      height: 410,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Talk to an astrologer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "See All >",
                style: TextStyle(color: Color(0xFFF57F17)),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Leading astrologers of india are just a phone call away.Our panel of astrologer not just provides solutions to your life problems but also guide you so that you can take the right oath towards growth and prosperity.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                height: 1.2,
                letterSpacing: 0.2),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: ListView.builder(
                itemCount: astrologerData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              astrologerData[index]["img"],
                              height: 140,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: Text(
                                      astrologerData[index]["name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    )),
                                 Text(
                                  "${astrologerData[index]["rating"]}",
                                  style: const TextStyle(
                                      color: Color(0xFFF57F17),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  astrologerData[index]["astrology"]
                                      .split(",")[0],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹${astrologerData[index]["rate"]}/\nmin",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFFF57F17)),
                                    onPressed: () {},
                                    child: const Text("Talk Now"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

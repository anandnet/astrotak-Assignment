import './home%20screen%20components/ask.dart';
import './home%20screen%20components/customer_review.dart';
import './home%20screen%20components/daily_horoscope.dart';
import './home%20screen%20components/reports.dart';
import './home%20screen%20components/talk_astro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10),
      children: [
        SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  text: '""\n',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    height: 0.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            "  Threre is no better boat than\n  horoscope to help a man \n  cross over the sea of life.",
                        style: TextStyle(
        fontSize: 13, color: Colors.grey.shade700, height: 1.2, letterSpacing: 0.2)),
                    const TextSpan(text: '\n                                ""'),
                     TextSpan(
                        text: "\n           -Varahamihira",
                        style: TextStyle(
                            fontSize: 14, height: 1, color: Colors.grey.shade500))
                  ],
                ),
              ),
              CircleAvatar(
                radius: 38,
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/ganesha.png",
                      fit: BoxFit.contain,
                      height: 64,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const DailyHoroScope(),
        const SizedBox(height: 10),
        const TalkAstro(),
        const SizedBox(height: 10),
        const Reports(),
        const SizedBox(height: 30),
        const Ask(),
        const SizedBox(height: 10),
        const CustomerReview(),
        const SizedBox(height: 30),
        const Center(child: Text("© Copyright 2021 ALl Right Reserved",style: TextStyle(fontSize: 10,color: Colors.grey))),
        const SizedBox(height: 30),
      ],
    );
  }
}

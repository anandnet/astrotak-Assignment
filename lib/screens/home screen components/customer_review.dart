import 'package:astrotak/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hear from our Happy Customers!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userReviews.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 230,
                  height: 200,
                  child: Card(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '"',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.blue),
                                  )),
                              Flexible(
                                  child: Text(
                                userReviews[index]["review"],
                                style:  TextStyle(fontSize: 13,color: Colors.grey.shade700),
                              )),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                            color: Color(0xFFE8EAF6),
                            ),
                            height: 80,
                            width: 230,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(userReviews[index]["name"]),
                                const SizedBox(height:2),
                                Text(userReviews[index]["place"],style: const TextStyle(fontSize: 10),)
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 49,
                          left: 85,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFF57F17),
                            radius: 30,
                            child: Icon(Icons.person,color: Colors.white,size: 25,),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

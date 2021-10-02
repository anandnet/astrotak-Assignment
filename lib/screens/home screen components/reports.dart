import 'package:astrotak/data/dummy_data.dart';
import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Reports",
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
            "Astrology report  or what is commonly known as Horoscope report is basically an in depthlook at your birth chart. Horoscope report will look at various planetary positions in your birth charts and also derive relationships and angle to understand personality and trait.",
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
                  scrollDirection: Axis.horizontal,
                  itemCount: posterData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Stack(
                            children: [
                              Image.asset(
                                posterData[index]["img"],
                                height: 200,
                                width: 250,
                                fit: BoxFit.fill,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.only(left:10,right: 10),
                                  height: 50,
                                  width: 250,
                                  color: Colors.black26,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("₹${posterData[index]["price"]}/min",style: TextStyle(color: Colors.white),),
                                      ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                                  
                                  primary: Color(0xFFF57F17)),child: const Text("Buy Now"))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}

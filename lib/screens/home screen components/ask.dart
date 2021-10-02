import 'package:flutter/material.dart';
class Ask extends StatelessWidget {
  const Ask({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 310,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Ask a Question",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All >",
                    style: TextStyle(color: Color(0xFFF57F17)),
                  )
                ],
              ),
                const  SizedBox(height:10),
               Text(
                "Seek accurate answers to your life problems and guide you towards the right path whether the problem is related to love, self, life, bussiness, money, education or work, our astrologer will do an in depth study of your birth chart provide personalized responses along with remedies.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700,height: 1.2,letterSpacing: 0.2),
              ),
              const SizedBox(height: 10),
              Container(
                color: Color(0xFFE8EAF6),
                height: 140,
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choose Category",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Select a category:Love, career, more",style: TextStyle( color: Colors.black,),),
                          Icon(Icons.arrow_drop_down,color: Colors.black,)
                        ],
                      ),onPressed: (){},)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: '₹99',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11,color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' (including GST)',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Ideas what to ask",
                              style: TextStyle(
                               
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFF57F17)),
                              child: const Text(
                                "Ask a Question",
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import '../data/dummy_data.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({Key? key}) : super(key: key);

  @override
  _TalkScreenState createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  List<Map<String, dynamic>> astrData = [];
  @override
  void initState() {
    astrData = astrologerData;
    super.initState();
  }

  bool searching = false;
  final sortTypes = [
    "Experience- high to low",
    "Experience-low to high",
    "Price- high to low",
    "Price- low to hight"
  ];
  bool portalActive = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Portal(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Talk to an Astrologer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //------------
                //Search icon
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          searching = true;
                        });
                      },
                      child: Image.asset(
                        "assets/icons/search.png",
                        height: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    //-------------
                    //Filter Icon
                    Image.asset(
                      "assets/icons/filter.png",
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    //----------------
                    //Sort popup widget
                    PortalEntry(
                      visible: portalActive,
                      portal: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            portalActive = false;
                          });
                        },
                      ),
                      child: PortalEntry(
                        visible: portalActive,
                        //closeDuration: Duration(seconds: 5),
                        portalAnchor: Alignment.topRight,
                        childAnchor: Alignment.topLeft,
                        portal: SizedBox(
                          height: 260,
                          width: 250,
                          child: Material(
                            elevation: 8,
                            child: IntrinsicWidth(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,20,20,0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Sort by",style: TextStyle(color: Color(0xFFF57F17)),)),
                                    const Divider(thickness: 2),
                                    sortWidget("Experience-high to low"),
                                    sortWidget("Experience-low to high"),
                                    sortWidget("Price-high to low"),
                                    sortWidget("Price-low to high")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              portalActive = true;
                            });
                          },
                          child: Image.asset(
                            "assets/icons/sort.png",
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          searching
          //------------------------------
          //Searching widget
              ? Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Material(
                    elevation: 3.0,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    shadowColor: Colors.black45,
                    child: TextField(
                      onChanged: (x) {
                        List<Map<String, dynamic>> dummy = [];
                        for (int i = 0; i < astrologerData.length; i++) {
                          if (astrologerData[i]["name"]
                              .toLowerCase()
                              .contains(x.toLowerCase().trim())) {
                            dummy.add(astrologerData[i]);
                          }
                        }
                        setState(() {
                          astrData = dummy;
                        });
                      },
                      cursorColor: const Color(0xFFF57F17),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFFF57F17),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                searching = false;
                                astrData = astrologerData;
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFFF57F17),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(25, 25, 25, 0.05),
                          hintText: "Search Astrologer",
                          hintStyle: const TextStyle(fontSize: 14),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          contentPadding: const EdgeInsets.only(
                            bottom: 0, right: 10, // HERE THE IMPORTANT PART
                          )),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          //----------------------------
          //Astrologer Details Widget
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: astrData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * .25,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.network(
                              astrData[index]["img"],
                              height: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .49,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${astrData[index]["name"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.verified,
                                      color: Color(0xFFF57F17),
                                      size: 17,
                                    ),
                                    Expanded(
                                      child: Text(
                                        " ${astrData[index]["astrology"]}",
                                        softWrap: true,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.g_translate_outlined,
                                        color: Color(0xFFF57F17),
                                        size: 17,
                                      ),
                                      Text(
                                        " ${astrData[index]["language"]}",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 3,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.card_membership_sharp,
                                        color: Color(0xFFF57F17),
                                        size: 17,
                                      ),
                                      Text(" ₹${astrData[index]["rate"]}/Min",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(160, 45),
                                    primary: const Color(0xFFF57F17)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(Icons.call_outlined),
                                    Text("Talk on Call"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${astrData[index]["exp"]} Years",
                                style: const TextStyle(fontSize: 12),
                              )),
                        )
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget sortWidget(String name) {
    return Row(
      children: [
        Radio(value: name, groupValue: "x", onChanged: (x){}),
        Text(name)
      ],
    );
  }
}

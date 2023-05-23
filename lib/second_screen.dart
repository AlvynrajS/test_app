import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var now = DateTime.now();

  var wDay = DateFormat('EEE').format(DateTime.now());
  var day = DateFormat('d').format(DateTime.now());
  late DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  int startTime = 0;
  int endTime = 11;

  @override
  Widget build(BuildContext context) {
    int hoursLeft = endTime - startTime + 1;
    var hours = List.generate(
            hoursLeft * 2,
            (i) =>
                '${endTime - (i / 2).truncate()}:${i % 2 == 1 ? '00' : '30'}')
        .reversed
        .toList();

    return Stack(children: [
      Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(150.0),
              child: Center(
                child: AppBar(
                  title: const Text("Detail Doctor"),
                  toolbarHeight: 150,
                  centerTitle: true,
                  // leading: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white.withOpacity(0.8),
                  //         shape: BoxShape.circle),
                  //     child: Center(
                  //         child: IconButton(
                  //             onPressed: () {
                  //               Navigator.pop(context);
                  //             },
                  //             icon: const Icon(
                  //               Icons.arrow_back_ios,
                  //               size: 20,
                  //             )))),
                ),
              )),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "dr.Kabuto Yakushi",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Text(
                        "Heart Specialist",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.blue.withOpacity(0.5),
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customColumn("Patient", "1324"),
                        const SizedBox(
                            height: 25,
                            child: VerticalDivider(
                                width: 30, color: Colors.white)),
                        customColumn("Experience", "10 yrs"),
                        const SizedBox(
                            height: 25,
                            child: VerticalDivider(
                                width: 30, color: Colors.white)),
                        customColumn("Rating", "4.6")
                      ],
                    ),
                    // shape: ,
                  ),
                  const SizedBox(height: 20),
                  const Text("About Doctor",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const ReadMoreText(
                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.hdbshfikabfkjscdnjkfsnlnd dkjsnlnfvlddn nljknsdlvnlsnd snlkfnld dknlksm fd vnslkndlkv lndfnlnmd smnlkfmnlkmf sdklfgnlkdmv djmfkm;gdm fmgk;dm;mf, d l;m;lm;lml;mdfbjhbfkfdsn sbfkndfknds nbsjknfk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trimLines: 3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text("Select Schedule",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.lightBlue.withOpacity(0.1),
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              lastDayOfMonth.day,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: SizedBox(
                                      height: 80,
                                      width: 60,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 4.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              () {
                                                final currentDate =
                                                    lastDayOfMonth.add(Duration(
                                                        days: index + 1));

                                                final dateName = DateFormat('E')
                                                    .format(currentDate);
                                                return Text(dateName);
                                              }(),
                                              const SizedBox(height: 10),
                                              Text(
                                                "${index + 1}",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              growable: true)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Morning",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.lightBlue.withOpacity(0.1),
                    height: 100,
                    width: 150,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: hours != null
                            ? Row(
                                children: List.generate(
                                    hours.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.only(
                                              right: 24.0),
                                          child: SizedBox(
                                            height: 50,
                                            width: 100,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              elevation: 4.0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    () {
                                                      final time = hours[index];

                                                      return Text(time);
                                                    }(),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      "AM",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    growable: true))
                            : SizedBox()),
                  ),
                  const Text("Evening",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.lightBlue.withOpacity(0.1),
                    height: 100,
                    width: 150,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                hours.length,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 24.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          elevation: 4.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                () {
                                                  final time = hours[index];

                                                  return Text((time == "00:00")
                                                      ? "11:00"
                                                      : time);
                                                }(),
                                                const SizedBox(width: 10),
                                                Text("PM"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                growable: true))),
                  ),
                ],
              ),
            ),
          )),
      Positioned(
        top: 130,
        left: MediaQuery.of(context).size.width / 2.5,
        child: GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            radius: 35, // Image radius
            backgroundColor: Colors.orange,
          ),
        ),
      )
    ]);
  }

  Widget customColumn(String heading, String content) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(heading),
        const SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

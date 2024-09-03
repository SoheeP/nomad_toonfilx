import 'package:flutter/material.dart';
import 'package:nomad_toonfilx/widgets/challenge/gray_date.dart';
import 'package:nomad_toonfilx/widgets/challenge/gray_name.dart';

var yellowColor = const Color(0xfffef754);
var purpleColor = const Color(0xff9c6bce);
var greenColor = const Color(0xffbcee4b);

List<Widget> makeDateWithSpace(List<String> text) {
  var widgets = <Widget>[];
  for (var i = 0; i < text.length; i++) {
    widgets.add(GrayDate(text: text[i]));
    widgets.add(const SizedBox(width: 20));
  }
  return widgets;
}

List<Widget> makeNameWithSpace(List<String> text) {
  var widgets = <Widget>[];
  for (var i = 0; i < text.length; i++) {
    widgets.add(GrayName(text: text[i]));
    widgets.add(const SizedBox(width: 30));
  }
  return widgets;
}

class CodeChallengeApp extends StatelessWidget {
  const CodeChallengeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1f1f1f),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                80,
                20,
                20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://i.namu.wiki/i/bP5wMYbr6XtBmjouJGHZh0hoinb7EJm5uNA8E8F4HNft5gZrWb6x92WlLVH5JEd1ChQZXQJpmV5faXAwko43uQ.webp",
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MONDAY 16',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        const Text(
                          'TODAY',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xffb22580),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Row(
                          children: makeDateWithSpace(
                              ['17', '18', '19', '20', '21', '22']),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "11",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "30",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "|",
                              ),
                              Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "20",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("DESIGN",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -1,
                                      height: 1,
                                    )),
                                Text(
                                  "MEETING",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children:
                                  makeNameWithSpace(['ALEX', 'HELENA', 'NANA']),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "35",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "|",
                              ),
                              Text(
                                "14",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("DAILY",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -1,
                                      height: 1,
                                    )),
                                Text(
                                  "PROJECT",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text("ME",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    )),
                                const SizedBox(width: 30),
                                ...makeNameWithSpace(['RICHARD', 'CIRY', '+4'])
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "15",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "00",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "|",
                              ),
                              Text(
                                "16",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              Text(
                                "30",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("WEEKLY",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -1,
                                      height: 1,
                                    )),
                                Text(
                                  "PLANNING",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children:
                                  makeNameWithSpace(['DEN', 'NANA', 'MARK']),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

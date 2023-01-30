// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

bool Switched = false;

class VersesPage extends StatefulWidget {
  const VersesPage({Key? key}) : super(key: key);

  @override
  State<VersesPage> createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> chapter =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "${chapter["name"]}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Chapter Summary",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      (Switched == false)
                          ? "${chapter["chapter_summary"]}"
                          : "${chapter["chapter_summary_hindi"]}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      (Switched == false) ? "English" : "Hindi",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.39,
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch(
                              activeColor: Colors.orange,
                              value: Switched,
                              onChanged: (val) {
                                setState(() {
                                  Switched = val;
                                });
                              }),
                        ),
                        const Spacer(),
                        Text(
                          "Verses ${chapter["verses_count"]}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...chapter['verses_list']
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, top: 10, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'verses_details',
                                  arguments: e);
                            },
                            child: Neumorphic(
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Colors.orangeAccent,
                                ),
                                child: Text(
                                  "Verse ${e['verse_number']}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            // ListView.builder(
            //   physics: BouncingScrollPhysics(),
            //   padding: const EdgeInsets.only(top: 10, bottom: 20),
            //   itemCount: chapter['verses_list'].length,
            //   itemBuilder: (context, i) {
            //     return Padding(
            //       padding: const EdgeInsets.only(
            //           right: 15, left: 15, top: 10, bottom: 10),
            //       child: Neumorphic(
            //         child: Container(
            //           height: MediaQuery.of(context).size.height * 0.1,
            //           width: MediaQuery.of(context).size.width,
            //           decoration: BoxDecoration(
            //             color: Colors.orangeAccent,
            //           ),
            //           // child: Text("${chapter[]}"),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}

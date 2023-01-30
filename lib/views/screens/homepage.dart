import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List chapter = [];

  void decodeData() async {
    // String jsonData = await rootBundle.loadString("assets/json/data.json");
    String chapterData =
        await rootBundle.loadString("assets/json/chapter.json");

    List decodeChapter = jsonDecode(chapterData);

    setState(() {
      chapter = decodeChapter;
    });
  }

  @override
  void initState() {
    super.initState();
    decodeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "श्रीमद् भगवद्गीता",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: GridView.builder(
          itemCount: chapter.length,
          padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 25),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  'verse_page',
                  arguments: chapter[i],
                );
              },
              child: Neumorphic(
                style: const NeumorphicStyle(shadowDarkColorEmboss: Colors.black),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Chapter',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${chapter[i]["chapter_number"]}",
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

      // ListView.builder(itemCount: finalresult.length,itemBuilder: (context,i){
      //   return ListTile(
      //     leading: Text("${finalresult[i]['id']}"),
      //     title: Text("${finalresult[i]['name']}"),
      //   );
      // })
    );
  }
}

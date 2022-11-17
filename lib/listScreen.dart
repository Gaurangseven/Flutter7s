import 'package:flutter/material.dart';
import 'package:flutter7s/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DeveloperList.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b2430),
      appBar: AppBar(
        backgroundColor: const Color(0xff01111d),
        title: const Text("Developers"),
      ),
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return InfoBox(
              ndata: dataList[index].name.toString(),
              ntitle: dataList[index].title.toString(),
              tlink: dataList[index].twitterlink.toString(),
              ilink: dataList[index].instalink.toString(),
              glink: dataList[index].githublink.toString(),
              uimagename: dataList[index].userimagename.toString(),
            );
          }),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    required this.ndata,
    required this.ntitle,
    required this.tlink,
    required this.ilink,
    required this.glink,
    required this.uimagename,
  }) : super(key: key);

  final String ndata;
  final String ntitle;
  final String tlink;
  final String ilink;
  final String glink;
  final String uimagename;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 4),
      child: Container(
        height: 100,
        color: Color(0xff01111d),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/$uimagename.png'),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(ndata,
                      style: ktextname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(ntitle, style: ktitle),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(tlink));
                        },
                        child: Image.asset(
                          'assets/twitter.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(ilink));
                        },
                        child: Image.asset(
                          'assets/instagram.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(glink));
                        },
                        child: Image.asset(
                          'assets/github.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

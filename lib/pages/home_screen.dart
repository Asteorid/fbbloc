import 'package:fbbloc/constants/text_style.dart';
import 'package:fbbloc/json_page/second_page.dart';
import 'package:fbbloc/pages/first_page.dart';
import 'package:fbbloc/pages/fourth_page.dart';
import 'package:fbbloc/pages/third_page.dart';
import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int pageIndex = 0;
  final pages = [
    const FirstPage(),
    SecondPage(
      postId: 1,
    ),
    const ThirdPage(),
    const FourthPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Instunder",
            style: TextLogo.instunder,
          ),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                      size: 35,
                    )),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 35,
                    )),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.qr_code_2_rounded,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.qr_code_2_outlined,
                      color: Colors.grey,
                      size: 35,
                    )),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                      Icons.person_4,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.person_4_outlined,
                      color: Colors.grey,
                      size: 35,
                    )),
        ],
      ),
    );
  }
}

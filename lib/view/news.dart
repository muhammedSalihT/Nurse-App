import 'package:flutter/material.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/bottom_nav_icons.dart';
import 'package:project_una/widgets/navbar.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const UserBottomIcons(),
      drawer: const NavBar(),
      appBar: AppBarWidget(text: "News"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(color: Colors.blue)),
              width: 358,
              height: 168,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                          "images/healthcare-workers-prevent-virus-insurance-medicine-concept-smiling-attractive-female-doctor-nurse-blue-scrubs-pointing-fingers-left-show-patients-advertisement-important-info 1.jpg"),
                      const Text(
                        "Contrary to popular belief, \nLorem Ipsum is not simply \nrandom text. It has roots \nin a piece of classical Latin \nliterature from 45 BC, \nmaking it over 2000 \nyears old.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(DateTime.now().toString()),
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

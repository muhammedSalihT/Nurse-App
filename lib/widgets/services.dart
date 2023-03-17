import 'package:flutter/material.dart';

class HomePageServices extends StatelessWidget {
  HomePageServices(
      {super.key,
      required this.title,
      required this.link,
      required this.function,
      required this.buttonTitle,
      required this.showText,
      this.secondText});

  String title;
  String link;
  String buttonTitle;
  Function function;
  bool showText = false;
  String? secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          child: GestureDetector(
            onTap: () {
              function();
            },
            child: Container(
              width: 358,
              height: 135,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.blue.shade100,
                  ),
                  left: BorderSide(
                    color: Colors.blue.shade100,
                  ),
                  top: BorderSide(
                    color: Colors.blue.shade200,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        showText == false
                            ? const SizedBox()
                            : Text(secondText!),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // function();
                          },
                          child: Text(
                            buttonTitle,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Image.asset(link))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

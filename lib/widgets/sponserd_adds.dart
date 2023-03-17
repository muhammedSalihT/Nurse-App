import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/widgets/webpage_widget.dart';

class SponSerdAdds extends StatelessWidget {
  SponSerdAdds(
      {super.key,
      required this.iamgepath,
      required this.weblink,
      required this.showappbar});

  String iamgepath;
  String weblink;
  bool showappbar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  WeblinkWidget(webLink: weblink, showAppbar: showappbar),
            ));
          },
          child: Container(
            width: 358.w,
            height: 130.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(iamgepath), fit: BoxFit.fill),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

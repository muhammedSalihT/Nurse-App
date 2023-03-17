import 'package:flutter/material.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
          leadingIcon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          centerTitle: Text(
            "Terms and Conditions",
            style: TextStyle(color: ThemeConstents.appBodyBlack),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 51,
          ),
          Center(
            child: SizedBox(
              height: 447.h,
              width: 315.w,
              child: Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.2.h,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}

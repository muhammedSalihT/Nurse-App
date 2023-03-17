import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view/faculty_registration_screen.dart';
import 'package:project_una/view/nurses_registration_screen.dart';
import 'package:project_una/view/other_healthcare_workers_screen.dart';
import 'package:project_una/view/students_registration_screen.dart';
import 'package:project_una/view_model/faculty_registration_screen_viewmodel.dart';
import 'package:project_una/view_model/nurses_registration_screen_viewmodel.dart';
import 'package:project_una/view_model/other_healthcare_workers_screen_viewmodel.dart';
import 'package:project_una/view_model/students_registration_screen_viewmodel.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/committees_widgets.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class RegistartionScreen extends StatefulWidget {
  const RegistartionScreen({super.key});

  @override
  State<RegistartionScreen> createState() => _RegistartionScreenState();
}

class _RegistartionScreenState extends State<RegistartionScreen> {
  @override
  void initState() {
    final nursesRegistrationViewModel =
        Provider.of<NursesRegistrationViewModel>(context, listen: false);
    final facultyProvider =
        Provider.of<FacultyRegistrationViewModel>(context, listen: false);
    final studentProvider =
        Provider.of<StudentRegistrationViewModel>(context, listen: false);
    final otherProvider =
        Provider.of<OtherHealthCareWorkersViewModel>(context, listen: false);
    nursesRegistrationViewModel.getUserData();
    facultyProvider.getUserData();
    studentProvider.getUserData();
    otherProvider.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentRegistrationViewModel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppbarWidget(
        leadingIcon: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ));
          },
        ),
        centerTitle: Image.asset("images/unalogo.png"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Select Any Category Which You Belong",
                  style: TextStyle(fontSize: 18.sp),
                ),
                CommitteesWidget(
                    color: true,
                    content: "Nurses Registration",
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NursesRegistrationScreen(),
                      ));
                    }),
                CommitteesWidget(
                    content: "Faculty Registration",
                    color: true,
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FacultyRegistrationScreen(),
                      ));
                    }),
                CommitteesWidget(
                    content: "Students Registration",
                    color: true,
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudentsRegistrationScreen(),
                      ));
                    }),
                CommitteesWidget(
                  content: "Other healthcare workers",
                  color: true,
                  function: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OtherHealthWorkersScreen(),
                    ));
                  },
                ),
                Consumer<StudentRegistrationViewModel>(
                    builder: (context, studentProvider, _) {
                  return Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: ButtonWidget(
                        cupertinoColor: ThemeConstents.appPrimeryColor,
                        loadingWidget: Text(
                          "Please Wait...",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: ThemeConstents.appPrimeryColor),
                        ),
                        isLoading: studentProvider.isSkip,
                        buttonname: "Skip Registration",
                        buttonColor: Colors.white,
                        textColor: ThemeConstents.appPrimeryColor,
                        height: 40.h,
                        width: 200.w,
                        onclick: () async {
                          !studentProvider.isSkip
                              ? studentProvider.goToHome(context)
                              : null;
                        }),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

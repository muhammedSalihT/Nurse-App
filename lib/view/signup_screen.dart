import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view_model/authentication_screen_viewmodel.dart';
import 'package:project_una/widgets/reusable_widhet.dart';
import 'package:project_una/widgets/signin_signup_buttonwidget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationViewModel =
        Provider.of<AuthenticationViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 80.h, 0, 0),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: authenticationViewModel.signUpKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 250.h,
                      ),
                      reusableTextField(
                        "Enter Email",
                        Icons.alternate_email_sharp,
                        false,
                        authenticationViewModel.emailTextControlller,
                        validation: (value) {
                          if (!RegExp(r'\S+@\S+\.\S+')
                              .hasMatch(value.toString())) {
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Consumer<AuthenticationViewModel>(
                          builder: (context, authenticationViewModel, _) {
                        return reusableTextField(
                          isEmailType: false,
                          "Enter Password",
                          Icons.lock_outline,
                          authenticationViewModel.isSignUpPasswordShowing
                              ? false
                              : true,
                          authenticationViewModel.passwordTextController,
                          onSuffixPressed: () {
                            authenticationViewModel.onSignUpPasswordPressed();
                          },
                          suffixIcon:
                              authenticationViewModel.isSignUpPasswordShowing
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                          validation: (value) {
                            if (value!.length < 6) {
                              return "Required minimum 6 characters";
                            }
                            return null;
                          },
                        );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      // IntlPhoneField(
                      //   onChanged: (value) {
                      //     authenticationViewModel
                      //         .setPhoneNumber(value.completeNumber.substring(1));
                      //   },
                      //   validator: (value) {
                      //     if (value.toString().isEmpty || value == null) {
                      //       return "Enter Valid Phone Number";
                      //     }
                      //     return null;
                      //   },
                      //   cursorColor: Colors.white,
                      //   invalidNumberMessage: "Enter Your Phone Number",
                      //   showCountryFlag: false,
                      //   decoration: InputDecoration(
                      //       prefixIcon: const Icon(Icons.person_outline,
                      //           color: Colors.black),
                      //       labelText: "Phone Number",
                      //       labelStyle:
                      //           TextStyle(color: Colors.black.withOpacity(0.9)),
                      //       filled: true,
                      //       floatingLabelBehavior: FloatingLabelBehavior.never,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30.0),
                      //           borderSide: const BorderSide(
                      //               width: 0, style: BorderStyle.none))),
                      //   initialCountryCode: 'IN',
                      //   flagsButtonMargin: EdgeInsets.only(left: 5.w),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      Visibility(
                        visible: authenticationViewModel.isEmailVerify,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Verification Link Sended To Above Email,Please Verify It Before TimeOut",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "00:${authenticationViewModel.start} seconds",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: authenticationViewModel.isVerified,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Verification Completed",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.done_outline_rounded,
                              color: Colors.green,
                              size: 14.sp,
                            )
                          ],
                        ),
                      ),
                      SignInSignUpButton(
                        isLogin: false,
                        isChecking: authenticationViewModel.isSignUpChecking,
                        onTap: () {
                          authenticationViewModel.isSignUpChecking
                              ? null
                              : authenticationViewModel.userSignUp(context);
                        },
                      ),
                      signInOption(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have An account?",
            style: TextStyle(color: ThemeConstents.appPrimeryColor)),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text("Sign In",
              style: TextStyle(
                  color: ThemeConstents.appPrimeryColor,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
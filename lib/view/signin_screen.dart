import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view/signup_screen.dart';
import 'package:project_una/view_model/signin_viewmodel.dart';
import 'package:project_una/widgets/reusable_widhet.dart';
import 'package:project_una/widgets/signin_signup_buttonwidget.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sigInViewModel = Provider.of<SignInViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(00, 80.h, 0, 0),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: sigInViewModel.formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250.h,
                    ),
                    reusableTextField(
                      "Enter Email",
                      Icons.alternate_email_sharp,
                      false,
                      sigInViewModel.emailTextControlller,
                      validation: (value) {
                        if (!RegExp(r'\S+@\S+\.\S+')
                            .hasMatch(value.toString())) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<SignInViewModel>(
                        builder: (context, authenticationViewModel, _) {
                      return reusableTextField(
                        isEmailType: false,
                        "Enter Password",
                        Icons.lock_outline,
                        sigInViewModel.isSignInPasswordShowing ? false : true,
                        sigInViewModel.passwordTextController,
                        onSuffixPressed: () {
                          sigInViewModel.onSignInPasswordPressed();
                        },
                        suffixIcon:
                            authenticationViewModel.isSignInPasswordShowing
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
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => sigInViewModel.passwordReset(context),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: ThemeConstents.appPrimeryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SignInSignUpButton(
                      isChecking: sigInViewModel.isSignInChecking,
                      isLogin: true,
                      onTap: () {
                        sigInViewModel.signIn(context);
                      },
                    ),
                    signUpOption(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have account?",
            style: TextStyle(color: ThemeConstents.appPrimeryColor)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: Text("Sign Up",
              style: TextStyle(
                  color: ThemeConstents.appPrimeryColor,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

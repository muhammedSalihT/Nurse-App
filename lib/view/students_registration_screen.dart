import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/drag_and_drop_widget.dart';
import 'package:project_una/widgets/fixed_form_field.dart';
import 'package:project_una/widgets/form_title_container.dart';
import 'package:project_una/widgets/inputformfieldwidgets.dart';
import 'package:project_una/widgets/inputformphfield_widget.dart';
import 'package:project_una/view_model/students_registration_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class StudentsRegistrationScreen extends StatelessWidget {
  StudentsRegistrationScreen({super.key});

  late StudentRegistrationViewModel studentRegistrationViewModel;

  @override
  Widget build(BuildContext context) {
    studentRegistrationViewModel =
        Provider.of<StudentRegistrationViewModel>(context);
    return Scaffold(
      backgroundColor: ThemeConstents.appBodyColor,
      appBar: CustomAppbarWidget(
        leadingIcon: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: Container(
          height: 40.h,
          width: 134.w,
          decoration: BoxDecoration(
              color: ThemeConstents.appBodyColor,
              image: const DecorationImage(
                  image: AssetImage("images/unalogo.png"))),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: studentRegistrationViewModel.studentformKey,
            child: Column(
              children: [
                FormFeildTitle(
                  title: "Students Registration",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 36.h),
                      child: InputFormFieldWidget(
                        keyboardtype: TextInputType.name,
                        controller:
                            studentRegistrationViewModel.firstnameController,
                        hinttext: "First Name",
                      ),
                    ),
                    InputFormFieldWidget(
                      keyboardtype: TextInputType.name,
                      controller:
                          studentRegistrationViewModel.lastnameController,
                      hinttext: "Last Name",
                    ),
                    InputFormPhFieldWidget(
                        labelText: "Mobile Number",
                        controller:
                            studentRegistrationViewModel.phoneController),
                    InputFormPhFieldWidget(
                        labelText: "Whatsup Number",
                        controller:
                            studentRegistrationViewModel.whatsappController),
                    FixedFormField(
                        labelText: "Your Registred Email",
                        initialvalue: studentRegistrationViewModel.initialEmail
                            .toString()),
                    InputFormFieldWidget(
                      maxLines: 4,
                      keyboardtype: TextInputType.name,
                      controller:
                          studentRegistrationViewModel.addressController,
                      hinttext: "Native Address",
                    ),
                    InputFormFieldWidget(
                      onTap: () {
                        studentRegistrationViewModel.takeDateOfBirth(context);
                      },
                      readOnly: true,
                      controller:
                          studentRegistrationViewModel.dateOfBirthController,
                      keyboardtype: TextInputType.streetAddress,
                      hinttext: "Date Of Birth",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 30.w, top: 12.h, bottom: 10.h),
                      child: FormBuilderRadioGroup(
                        activeColor: ThemeConstents.appPrimeryColor,
                        onChanged: (newValue) {
                          studentRegistrationViewModel
                              .changestudentgender(newValue);
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 18.h),
                          labelText: "Gender",
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                        ),
                        orientation: OptionsOrientation.horizontal,
                        name: "Gender",
                        validator: FormBuilderValidators.required(),
                        options: ['Male', 'Female'].map((gender) {
                          return FormBuilderFieldOption(value: gender);
                        }).toList(growable: false),
                      ),
                    ),
                    InputFormFieldWidget(
                      validation: (value) {
                        return studentRegistrationViewModel
                            .otpValidation(value);
                      },
                      controller: studentRegistrationViewModel.pinController,
                      keyboardtype: TextInputType.number,
                      hinttext: "PIN Code",
                    ),
                    InputFormFieldWidget(
                      controller:
                          studentRegistrationViewModel.instituteNameController,
                      hinttext: "Institute Name",
                      keyboardtype: TextInputType.name,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 30.w, top: 12.h, bottom: 10.h),
                      child: FormBuilderRadioGroup(
                        activeColor: ThemeConstents.appPrimeryColor,
                        onChanged: (newValue) {
                          studentRegistrationViewModel
                              .changestudentcourse(newValue);
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 18.h),
                          labelText: "Course",
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                        ),
                        orientation: OptionsOrientation.horizontal,
                        name: "Course",
                        validator: FormBuilderValidators.required(),
                        options: ['GNM', 'BSC', 'MSC'].map((gender) {
                          return FormBuilderFieldOption(value: gender);
                        }).toList(growable: false),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, bottom: 15.h),
                      child: Consumer<StudentRegistrationViewModel>(
                          builder: (context, studentRegistrationViewModel, _) {
                        return CSCPicker(
                          dropdownDecoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: ThemeConstents.appBodyColor,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          dropdownDialogRadius: 20.0,
                          searchBarRadius: 20.0,
                          onCountryChanged: (value) {
                            studentRegistrationViewModel.changecountry(value);
                          },
                          onStateChanged: (value) {
                            studentRegistrationViewModel
                                .changestate(value.toString());
                          },
                          onCityChanged: (value) {
                            studentRegistrationViewModel
                                .changecity(value.toString());
                          },
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 32.w, bottom: 15.h),
                      child: const Text("Upload Profile photo"),
                    ),
                    DragAndDropOrAddPhotoWidget(
                      image: studentRegistrationViewModel.image1,
                      showimagegallery: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          studentRegistrationViewModel
                              .selectimagefromgallery(context);
                        });
                      },
                      showimagecamera: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          studentRegistrationViewModel
                              .selectimagefromcamera(context);
                        });
                      },
                      removeprofile: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          studentRegistrationViewModel.removephoto();
                        });
                      },
                    ),
                    InputFormFieldWidget(
                      isValidating: false,
                      controller:
                          studentRegistrationViewModel.remarksController,
                      keyboardtype: TextInputType.name,
                      hinttext: "Remarks",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        bottom: 25.h,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: ThemeConstents.appPrimeryColor,
                            value: studentRegistrationViewModel.checkboxvalue,
                            onChanged: (value) {
                              studentRegistrationViewModel
                                  .chnagevalueincheckbox(value!);
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                            ),
                          ),
                          Text(
                            "by checking this box you agree below terms and conditions",
                            style: TextStyle(fontSize: 10.sp),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 275.w,
                        height: 90.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1.I Accept United Nurses Association by-law.",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Text(
                              "2.I'm having a clean profile No disciplinary action has been taken by the UNA State Committee so far",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Text(
                              "3. I hereby declare that the information provided is true and correct. I also understand that any willful dishonesty may render for refusal of this....",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 45.h,
                ),
                studentRegistrationViewModel.checkboxvalue
                    ? ButtonWidget(
                        isLoading: studentRegistrationViewModel.isLoading,
                        buttonname: "Submit",
                        height: 34.h,
                        width: 114.w,
                        onclick: () {
                          studentRegistrationViewModel.isLoading
                              ? null
                              : studentRegistrationViewModel.saveForm(context);
                        },
                      )
                    : SizedBox(
                        height: 34.h,
                        width: 114.w,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 142, 190, 229)
                                  .withOpacity(0.5),
                            )),
                            onPressed: () {},
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color:
                                    ThemeConstents.appBodyColor.withOpacity(.4),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

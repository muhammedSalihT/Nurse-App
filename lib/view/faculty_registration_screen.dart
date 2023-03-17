import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view_model/account_screen_viewmodel.dart';
import 'package:project_una/view_model/faculty_registration_screen_viewmodel.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/drag_and_drop_widget.dart';
import 'package:project_una/widgets/fixed_form_field.dart';
import 'package:project_una/widgets/form_title_container.dart';
import 'package:project_una/widgets/inputformfieldwidgets.dart';
import 'package:project_una/widgets/inputformphfield_widget.dart';
import 'package:provider/provider.dart';

class FacultyRegistrationScreen extends StatelessWidget {
  const FacultyRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final facultyRegistrationViewModel =
        Provider.of<FacultyRegistrationViewModel>(context);
    final accountScreenViewModel = Provider.of<AccountScreenViewModel>(context);
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
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: facultyRegistrationViewModel.formKey,
          child: Column(
            children: [
              FormFeildTitle(
                title: "Faculty Registration",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 36.h),
                    child: InputFormFieldWidget(
                      hinttext: "First Name",
                      controller:
                          facultyRegistrationViewModel.firstnameController,
                      keyboardtype: TextInputType.name,
                    ),
                  ),
                  InputFormFieldWidget(
                    hinttext: "Last Name",
                    controller: facultyRegistrationViewModel.lastnameController,
                    keyboardtype: TextInputType.name,
                  ),
                  InputFormPhFieldWidget(
                      labelText: "Mobile Number",
                      controller: facultyRegistrationViewModel.phoneController),
                  InputFormPhFieldWidget(
                      labelText: "Whatsup Number",
                      controller:
                          facultyRegistrationViewModel.whatsappController),
                  FixedFormField(
                      labelText: "Your Registred Email",
                      initialvalue:
                          facultyRegistrationViewModel.initialEmail.toString()),
                  InputFormFieldWidget(
                    maxLines: 4,
                    controller: facultyRegistrationViewModel.addressController,
                    keyboardtype: TextInputType.streetAddress,
                    hinttext: "Native Address",
                  ),
                  InputFormFieldWidget(
                    onTap: () {
                      facultyRegistrationViewModel.takeDateOfBirth(context);
                    },
                    readOnly: true,
                    controller:
                        facultyRegistrationViewModel.dateOfBirthController,
                    keyboardtype: TextInputType.streetAddress,
                    hinttext: "Date Of Birth",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.h, left: 30.w, right: 30.w, bottom: 15.h),
                    child: FormBuilderRadioGroup(
                      activeColor: ThemeConstents.appPrimeryColor,
                      initialValue: facultyRegistrationViewModel.accountgender,
                      onChanged: (newValue) {
                        facultyRegistrationViewModel
                            .changeaccountgender(newValue);
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 18.sp,
                            color: ThemeConstents.appBodyBlack),
                        labelText: "Genter",
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                      ),
                      orientation: OptionsOrientation.horizontal,
                      name: facultyRegistrationViewModel.genterRadioLabel,
                      validator: (value) {
                        return facultyRegistrationViewModel.validatingFunction(
                            value,
                            facultyRegistrationViewModel.genterRadioLabel);
                      },
                      options: ['Male', 'Female'].map((gender) {
                        return FormBuilderFieldOption(value: gender);
                      }).toList(growable: false),
                    ),
                  ),
                  InputFormFieldWidget(
                    validation: (value) {
                      return facultyRegistrationViewModel.otpValidation(value);
                    },
                    hinttext: "PIN Code",
                    controller: facultyRegistrationViewModel.pinController,
                    keyboardtype: TextInputType.number,
                  ),
                  InputFormFieldWidget(
                    hinttext: "Nursing Registration No",
                    controller: facultyRegistrationViewModel.regnoController,
                    keyboardtype: TextInputType.name,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
                    child: CSCPicker(
                      countryDropdownLabel: "Registration Country",
                      stateDropdownLabel: "Registration State",
                      cityDropdownLabel: "Registration City",
                      dropdownDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: ThemeConstents.appBodyColor,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      currentState:
                          facultyRegistrationViewModel.registrationState,
                      dropdownDialogRadius: 20.0.r,
                      searchBarRadius: 20.0.r,
                      onCountryChanged: (value) {},
                      onStateChanged: (value) {
                        facultyRegistrationViewModel
                            .changeRegistrationState(value);
                      },
                      onCityChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 30.w, left: 30.w, top: 12.h, bottom: 10.h),
                    child: FormBuilderRadioGroup(
                      activeColor: ThemeConstents.appPrimeryColor,
                      onChanged: (newValue) {
                        facultyRegistrationViewModel.selectWorking(newValue);
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 18.sp,
                            color: ThemeConstents.appBodyBlack),
                        labelText: "Currently Working?",
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                      ),
                      orientation: OptionsOrientation.horizontal,
                      name: facultyRegistrationViewModel.workingRadioLabel,
                      validator: (value) {
                        return facultyRegistrationViewModel.validatingFunction(
                            value,
                            facultyRegistrationViewModel.workingRadioLabel);
                      },
                      options: ['Yes', 'No'].map((gender) {
                        return FormBuilderFieldOption(value: gender);
                      }).toList(growable: false),
                    ),
                  ),
                  Consumer<FacultyRegistrationViewModel>(
                    builder: (context, facultyRegistrationViewModel, _) {
                      return facultyRegistrationViewModel.isWorking == "Yes"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.w, left: 32.w, bottom: 15.h),
                                  child: FormBuilderRadioGroup(
                                    onChanged: (newValue) {
                                      facultyRegistrationViewModel
                                          .changeplacefaculty(newValue);
                                    },
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          fontSize: 18.sp,
                                          color: ThemeConstents.appBodyBlack),
                                      labelText: "Working Place",
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                    ),
                                    orientation: OptionsOrientation.horizontal,
                                    name: facultyRegistrationViewModel
                                        .workingPlaceRadioLabel,
                                    validator: (value) {
                                      return facultyRegistrationViewModel
                                          .validatingFunction(
                                              value,
                                              facultyRegistrationViewModel
                                                  .workingPlaceRadioLabel);
                                    },
                                    options: [
                                      "Kerala",
                                      "Within India",
                                      "Outside India",
                                    ].map((gender) {
                                      return FormBuilderFieldOption(
                                          value: gender);
                                    }).toList(growable: false),
                                  ),
                                ),
                                InputFormFieldWidget(
                                  hinttext: "Hospital/Institute Name",
                                  controller: facultyRegistrationViewModel
                                      .hospitalnameController,
                                  keyboardtype: TextInputType.emailAddress,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 30.w, right: 30.w, bottom: 20.h),
                                  child: CSCPicker(
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: ThemeConstents.appBodyColor,
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1),
                                    ),
                                    currentCountry: facultyRegistrationViewModel
                                        .workingContry,
                                    currentState: facultyRegistrationViewModel
                                        .workingState,
                                    currentCity: facultyRegistrationViewModel
                                        .workingCity,
                                    dropdownDialogRadius: 20.0.r,
                                    searchBarRadius: 20.0.r,
                                    onCountryChanged: (value) {
                                      facultyRegistrationViewModel
                                          .changecountry(value);
                                    },
                                    onStateChanged: (value) {
                                      facultyRegistrationViewModel
                                          .changestate(value.toString());
                                    },
                                    onCityChanged: (value) {
                                      facultyRegistrationViewModel
                                          .changecity(value.toString());
                                    },
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox();
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 20.w, left: 32.w, bottom: 15.h),
                    child: Text(
                      "Upload Profile photo",
                      style: TextStyle(
                          fontSize: 14.sp, color: ThemeConstents.appBodyBlack),
                    ),
                  ),
                  DragAndDropOrAddPhotoWidget(
                    image: facultyRegistrationViewModel.image1,
                    showimagecamera: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        facultyRegistrationViewModel
                            .selectimagefromcamera(context);
                      });
                    },
                    showimagegallery: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        facultyRegistrationViewModel
                            .selectimagefromgallery(context);
                      });
                    },
                    removeprofile: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        facultyRegistrationViewModel.removephoto();
                      });
                    },
                  ),
                  InputFormFieldWidget(
                    isValidating: false,
                    controller: facultyRegistrationViewModel.remarksController,
                    hinttext: "Remarks",
                    keyboardtype: TextInputType.text,
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
                          value: facultyRegistrationViewModel.checkboxvalue,
                          onChanged: (value) {
                            facultyRegistrationViewModel
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1. I Accept United Nurses Association by-law.",
                            style: TextStyle(fontSize: 13.sp),
                          ),
                          Text(
                            "2. I'm having a clean profile No disciplinary action has been taken by the UNA State Committee so far",
                            style: TextStyle(fontSize: 13.sp),
                          ),
                          Text(
                            "3. I hereby declare that the information provided is true and correct. I also understand that any willful dishonesty may render for refusal of this.",
                            style: TextStyle(fontSize: 13.sp),
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
              facultyRegistrationViewModel.checkboxvalue
                  ? ButtonWidget(
                      isLoading: facultyRegistrationViewModel.isLoading,
                      buttonname: "Submit",
                      height: 34.h,
                      width: 114.w,
                      onclick: () {
                        facultyRegistrationViewModel.isLoading
                            ? null
                            : facultyRegistrationViewModel.saveForm(context);
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
      )),
    );
  }
}

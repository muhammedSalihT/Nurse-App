import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view_model/nurses_registration_screen_viewmodel.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/drag_and_drop_widget.dart';
import 'package:project_una/widgets/fixed_form_field.dart';
import 'package:project_una/widgets/form_title_container.dart';
import 'package:project_una/widgets/inputformfieldwidgets.dart';
import 'package:project_una/widgets/inputformphfield_widget.dart';
import 'package:provider/provider.dart';

class NursesRegistrationScreen extends StatefulWidget {
  const NursesRegistrationScreen({super.key});

  @override
  State<NursesRegistrationScreen> createState() =>
      _NursesRegistrationScreenState();
}

class _NursesRegistrationScreenState extends State<NursesRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final nursesRegistrationViewModel =
        Provider.of<NursesRegistrationViewModel>(context);

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
            key: nursesRegistrationViewModel.formKey,
            child: Column(
              children: [
                FormFeildTitle(
                  title: " Nurses Registration",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 36.h),
                      child: InputFormFieldWidget(
                        keyboardtype: TextInputType.name,
                        controller:
                            nursesRegistrationViewModel.firstnameController,
                        hinttext: "First Name",
                      ),
                    ),
                    InputFormFieldWidget(
                      keyboardtype: TextInputType.name,
                      controller:
                          nursesRegistrationViewModel.lastnameController,
                      hinttext: "Last Name",
                    ),
                    InputFormPhFieldWidget(
                        labelText: "Mobile Number",
                        controller:
                            nursesRegistrationViewModel.phoneController),
                    InputFormPhFieldWidget(
                        labelText: "Whatsup Number",
                        controller:
                            nursesRegistrationViewModel.whatsappController),
                    FixedFormField(
                        labelText: "Your Registred Email",
                        initialvalue: nursesRegistrationViewModel.initialEmail
                            .toString()),
                    InputFormFieldWidget(
                      keyboardtype: TextInputType.name,
                      controller: nursesRegistrationViewModel.addressController,
                      maxLines: 4,
                      hinttext: "Native Address",
                    ),
                    InputFormFieldWidget(
                      onTap: () {
                        nursesRegistrationViewModel.takeDateOfBirth(context);
                      },
                      readOnly: true,
                      controller:
                          nursesRegistrationViewModel.dateOfBirthController,
                      keyboardtype: TextInputType.streetAddress,
                      hinttext: "Date Of Birth",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, left: 30.w, right: 30.w, bottom: 15.h),
                      child: FormBuilderRadioGroup(
                        activeColor: ThemeConstents.appPrimeryColor,
                        initialValue: nursesRegistrationViewModel.accountgender,
                        onChanged: (newValue) {
                          nursesRegistrationViewModel
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
                        name: nursesRegistrationViewModel.genterRadioLabel,
                        validator: (value) {
                          return nursesRegistrationViewModel.validatingFunction(
                              value,
                              nursesRegistrationViewModel.genterRadioLabel);
                        },
                        options: ['Male', 'Female'].map((gender) {
                          return FormBuilderFieldOption(value: gender);
                        }).toList(growable: false),
                      ),
                    ),
                    InputFormFieldWidget(
                      validation: (value) {
                        return nursesRegistrationViewModel.otpValidation(value);
                      },
                      keyboardtype: TextInputType.number,
                      controller: nursesRegistrationViewModel.pinController,
                      hinttext: "PIN Code",
                    ),
                    InputFormFieldWidget(
                      keyboardtype: TextInputType.name,
                      controller: nursesRegistrationViewModel.regnoController,
                      hinttext: "Nursing Registration No",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, bottom: 20.h),
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
                            nursesRegistrationViewModel.registrationState,
                        dropdownDialogRadius: 20.0.r,
                        searchBarRadius: 20.0.r,
                        onCountryChanged: (value) {},
                        onStateChanged: (value) {
                          nursesRegistrationViewModel
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
                        initialValue: nursesRegistrationViewModel.isWorking,
                        onChanged: (newValue) {
                          nursesRegistrationViewModel.selectWorking(newValue);
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
                        name: nursesRegistrationViewModel.workingRadioLabel,
                        validator: (value) {
                          return nursesRegistrationViewModel.validatingFunction(
                              value,
                              nursesRegistrationViewModel.workingRadioLabel);
                        },
                        options: ['Yes', 'No'].map((gender) {
                          return FormBuilderFieldOption(value: gender);
                        }).toList(growable: false),
                      ),
                    ),
                    Consumer<NursesRegistrationViewModel>(
                        builder: (context, nursesRegistrationViewModel, _) {
                      return nursesRegistrationViewModel.isWorking == "Yes"
                          ? Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.w, left: 32.w, bottom: 15.h),
                                  child: FormBuilderRadioGroup(
                                    activeColor: ThemeConstents.appPrimeryColor,
                                    onChanged: (newValue) {
                                      nursesRegistrationViewModel
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
                                    name: nursesRegistrationViewModel
                                        .workingPlaceRadioLabel,
                                    validator: (value) {
                                      return nursesRegistrationViewModel
                                          .validatingFunction(
                                              value,
                                              nursesRegistrationViewModel
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
                                  keyboardtype: TextInputType.name,
                                  controller: nursesRegistrationViewModel
                                      .hospitalnameController,
                                  hinttext: "Hospital/Institute Name",
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 30.w, right: 30.w, bottom: 15.h),
                                  child: Consumer<NursesRegistrationViewModel>(
                                      builder: (context,
                                          nursesRegistrationViewModel, _) {
                                    return CSCPicker(
                                      dropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: ThemeConstents.appBodyColor,
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1)),
                                      dropdownDialogRadius: 20.0,
                                      searchBarRadius: 20.0,
                                      onCountryChanged: (value) {
                                        nursesRegistrationViewModel
                                            .changecountry(value);
                                      },
                                      onStateChanged: (value) {
                                        nursesRegistrationViewModel
                                            .changestate(value.toString());
                                      },
                                      onCityChanged: (value) {
                                        nursesRegistrationViewModel
                                            .changecity(value.toString());
                                      },
                                    );
                                  }),
                                ),
                              ],
                            )
                          : const SizedBox();
                    }),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.w, left: 32.w, bottom: 15.h),
                      child: const Text("Upload Profile photo"),
                    ),
                    DragAndDropOrAddPhotoWidget(
                      image: nursesRegistrationViewModel.image1,
                      showimagegallery: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          nursesRegistrationViewModel
                              .selectimagefromgallery(context);
                        });
                      },
                      showimagecamera: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          nursesRegistrationViewModel
                              .selectimagefromcamera(context);
                        });
                      },
                      removeprofile: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          nursesRegistrationViewModel.removephoto();
                        });
                      },
                    ),
                    InputFormFieldWidget(
                      isValidating: false,
                      keyboardtype: TextInputType.name,
                      controller: nursesRegistrationViewModel.remarksController,
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
                            value: nursesRegistrationViewModel.checkboxvalue,
                            onChanged: (value) {
                              nursesRegistrationViewModel
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
                          ),
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
                              "1.I Accept United Nurses Association by-law.",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              "2.I'm having a clean profile No disciplinary action has been taken by the UNA State Committee so far",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              "3. I hereby declare that the information provided is true and correct. I also understand that any willful dishonesty may render for refusal of this....",
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
                nursesRegistrationViewModel.checkboxvalue
                    ? ButtonWidget(
                        isLoading: nursesRegistrationViewModel.isLoading,
                        buttonname: "Submit",
                        height: 34.h,
                        width: 114.w,
                        onclick: () {
                          nursesRegistrationViewModel.isLoading
                              ? null
                              : nursesRegistrationViewModel.saveForm(context);
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
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

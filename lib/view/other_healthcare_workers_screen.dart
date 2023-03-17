import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view_model/other_healthcare_workers_screen_viewmodel.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/drag_and_drop_widget.dart';
import 'package:project_una/widgets/fixed_form_field.dart';
import 'package:project_una/widgets/form_title_container.dart';
import 'package:project_una/widgets/inputformfieldwidgets.dart';
import 'package:project_una/widgets/inputformphfield_widget.dart';
import 'package:provider/provider.dart';

class OtherHealthWorkersScreen extends StatefulWidget {
  const OtherHealthWorkersScreen({super.key});

  @override
  State<OtherHealthWorkersScreen> createState() =>
      _OtherHealthWorkersScreenState();
}

class _OtherHealthWorkersScreenState extends State<OtherHealthWorkersScreen> {
  late OtherHealthCareWorkersViewModel otherHealthCareWorkersViewModel;
  // dynamic _value;

  @override
  Widget build(BuildContext context) {
    otherHealthCareWorkersViewModel =
        Provider.of<OtherHealthCareWorkersViewModel>(context);

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
            key: otherHealthCareWorkersViewModel.formKey,
            child: Column(
              children: [
                FormFeildTitle(
                  title: "Other healthcare workers",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 36.h),
                      child: InputFormFieldWidget(
                        keyboardtype: TextInputType.name,
                        controller:
                            otherHealthCareWorkersViewModel.firstnameController,
                        hinttext: "First Name",
                      ),
                    ),
                    InputFormFieldWidget(
                      keyboardtype: TextInputType.name,
                      controller:
                          otherHealthCareWorkersViewModel.lastnameController,
                      hinttext: "Last Name",
                    ),
                    InputFormPhFieldWidget(
                        labelText: "Mobile Number",
                        controller:
                            otherHealthCareWorkersViewModel.phoneController),
                    InputFormPhFieldWidget(
                        labelText: "Whatsup Number",
                        controller:
                            otherHealthCareWorkersViewModel.whatsappController),
                    FixedFormField(
                        labelText: "Your Registred Email",
                        initialvalue: otherHealthCareWorkersViewModel
                            .initialEmail
                            .toString()),
                    InputFormFieldWidget(
                      keyboardtype: TextInputType.name,
                      controller:
                          otherHealthCareWorkersViewModel.addressController,
                      maxLines: 4,
                      hinttext: "Native Address",
                    ),
                    InputFormFieldWidget(
                      onTap: () {
                        otherHealthCareWorkersViewModel
                            .takeDateOfBirth(context);
                      },
                      readOnly: true,
                      controller:
                          otherHealthCareWorkersViewModel.dateOfBirthController,
                      keyboardtype: TextInputType.streetAddress,
                      hinttext: "Date Of Birth",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, left: 30.w, right: 30.w, bottom: 15.h),
                      child: FormBuilderRadioGroup(
                        activeColor: ThemeConstents.appPrimeryColor,
                        initialValue:
                            otherHealthCareWorkersViewModel.accountgender,
                        onChanged: (newValue) {
                          otherHealthCareWorkersViewModel
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
                        name: otherHealthCareWorkersViewModel.genterRadioLabel,
                        validator: (value) {
                          return otherHealthCareWorkersViewModel
                              .validatingFunction(
                                  value,
                                  otherHealthCareWorkersViewModel
                                      .genterRadioLabel);
                        },
                        options: ['Male', 'Female'].map((gender) {
                          return FormBuilderFieldOption(value: gender);
                        }).toList(growable: false),
                      ),
                    ),
                    InputFormFieldWidget(
                      validation: (value) {
                        return otherHealthCareWorkersViewModel
                            .otpValidation(value);
                      },
                      keyboardtype: TextInputType.number,
                      controller: otherHealthCareWorkersViewModel.pinController,
                      hinttext: "PIN Code",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 30.w, left: 30.w, top: 12.h, bottom: 10.h),
                      child: FormBuilderRadioGroup(
                        activeColor: ThemeConstents.appPrimeryColor,
                        onChanged: (newValue) {
                          otherHealthCareWorkersViewModel
                              .selectWorking(newValue);
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
                        name: otherHealthCareWorkersViewModel.workingRadioLabel,
                        validator: (value) {
                          return otherHealthCareWorkersViewModel
                              .validatingFunction(
                                  value,
                                  otherHealthCareWorkersViewModel
                                      .workingRadioLabel);
                        },
                        options: ['Yes', 'No'].map((gender) {
                          return FormBuilderFieldOption(value: gender);
                        }).toList(growable: false),
                      ),
                    ),
                    Consumer<OtherHealthCareWorkersViewModel>(
                        builder: (context, otherHealthCareWorkersViewModel, _) {
                      return otherHealthCareWorkersViewModel.isWorking == "Yes"
                          ? Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.w, left: 32.w, bottom: 15.h),
                                  child: FormBuilderRadioGroup(
                                    activeColor: ThemeConstents.appPrimeryColor,
                                    onChanged: (newValue) {
                                      otherHealthCareWorkersViewModel
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
                                    name: otherHealthCareWorkersViewModel
                                        .workingPlaceRadioLabel,
                                    validator: (value) {
                                      return otherHealthCareWorkersViewModel
                                          .validatingFunction(
                                              value,
                                              otherHealthCareWorkersViewModel
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
                                  controller: otherHealthCareWorkersViewModel
                                      .hospitalnameController,
                                  hinttext: "Oraganisation Name",
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 30.w, right: 30.w, bottom: 15.h),
                                  child:
                                      Consumer<OtherHealthCareWorkersViewModel>(
                                          builder: (context,
                                              otherHealthCareWorkersViewModel,
                                              _) {
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
                                        otherHealthCareWorkersViewModel
                                            .changecountry(value);
                                      },
                                      onStateChanged: (value) {
                                        otherHealthCareWorkersViewModel
                                            .changestate(value.toString());
                                      },
                                      onCityChanged: (value) {
                                        otherHealthCareWorkersViewModel
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
                      image: otherHealthCareWorkersViewModel.image1,
                      showimagegallery: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          otherHealthCareWorkersViewModel
                              .selectimagefromgallery(context);
                        });
                      },
                      showimagecamera: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          otherHealthCareWorkersViewModel
                              .selectimagefromcamera(context);
                        });
                      },
                      removeprofile: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          otherHealthCareWorkersViewModel.removephoto();
                        });
                      },
                    ),
                    InputFormFieldWidget(
                      isValidating: false,
                      keyboardtype: TextInputType.name,
                      controller:
                          otherHealthCareWorkersViewModel.remarksController,
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
                            value:
                                otherHealthCareWorkersViewModel.checkboxvalue,
                            onChanged: (value) {
                              otherHealthCareWorkersViewModel
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
                otherHealthCareWorkersViewModel.checkboxvalue
                    ? ButtonWidget(
                        isLoading: otherHealthCareWorkersViewModel.isLoading,
                        buttonname: "Submit",
                        height: 34.h,
                        width: 114.w,
                        onclick: () {
                          otherHealthCareWorkersViewModel.isLoading
                              ? null
                              : otherHealthCareWorkersViewModel
                                  .saveForm(context);
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

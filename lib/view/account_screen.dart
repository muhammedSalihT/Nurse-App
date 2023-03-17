import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/repository/usrls.dart';
import 'package:project_una/view_model/account_screen_viewmodel.dart';
import 'package:project_una/view_model/faculty_registration_screen_viewmodel.dart';
import 'package:project_una/widgets/accountformfield.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/fixed_form_field.dart';
import 'package:project_una/widgets/inputformphfield_widget.dart';
import 'package:project_una/widgets/navbar.dart';
import 'package:project_una/widgets/una_id_card.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    final accountScreenViewModel =
        Provider.of<AccountScreenViewModel>(context, listen: false);
    accountScreenViewModel.getAccountData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final facultyViewModel = Provider.of<FacultyRegistrationViewModel>(context);
    final accountScreenViewModel =
        Provider.of<AccountScreenViewModel>(context, listen: false);
    log(accountScreenViewModel.accountgender.toString());
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarWidget(
        text: "My Account",
        myActionWidget: Center(
          child: InkWell(
            onTap: () => UnaMyIdCard.showMyCard(
                context,
                accountScreenViewModel.accountModel!.data.name,
                accountScreenViewModel.userEmail,
                accountScreenViewModel.accountModel!.data.address,
                accountScreenViewModel.accountModel!.data.dob,
                accountScreenViewModel.accountModel!.data.expiryDate,
                accountScreenViewModel.image),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "My Card",
                style: TextStyle(color: ThemeConstents.appPrimeryColor),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<AccountScreenViewModel>(
            builder: (context, accountScreenViewModel, _) {
          if (accountScreenViewModel.isInternet == true) {
            if (accountScreenViewModel.dataList.isEmpty) {
              return SizedBox(
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CupertinoActivityIndicator(
                        radius: 20,
                        color: ThemeConstents.appPrimeryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: const Text("Please wait..."),
                    )
                  ],
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () => accountScreenViewModel.getAccountData(context),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Form(
                      key: accountScreenViewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 26.w, top: 25.h),
                            child: Container(
                              height: 110.h,
                              width: 110.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.red,
                                ),
                              ),
                              child: Consumer<AccountScreenViewModel>(builder:
                                  (context, accountScreenViewModel, _) {
                                return Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: accountScreenViewModel.image ==
                                              "null"
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(90.r),
                                              child: accountScreenViewModel
                                                          .fileImage ==
                                                      null
                                                  ? Image.asset(
                                                      "images/Etsg0p2XMAA3Qf.jpg",
                                                      height: 108.h,
                                                      width: 108.h,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.file(
                                                      accountScreenViewModel
                                                          .fileImage!,
                                                      height: 108.h,
                                                      width: 108.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(90.r),
                                              child: accountScreenViewModel
                                                          .fileImage ==
                                                      null
                                                  ? Image.network(
                                                      AppUrls.baseUrl +
                                                          accountScreenViewModel
                                                              .image
                                                              .toString(),
                                                      height: 108.h,
                                                      width: 108.h,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.file(
                                                      accountScreenViewModel
                                                          .fileImage!,
                                                      height: 108.h,
                                                      width: 108.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                    ),
                                    SizedBox(
                                      child: accountScreenViewModel.isEditting
                                          ? GestureDetector(
                                              onTap: () {
                                                accountScreenViewModel
                                                    .showimageSource(
                                                  context: context,
                                                  showimagegallery: () {
                                                    accountScreenViewModel
                                                        .selectimagefromgallery(
                                                            context);
                                                  },
                                                  showimagecamera: () {
                                                    accountScreenViewModel
                                                        .selectimagefromcamera(
                                                            context);
                                                  },
                                                );
                                              },
                                              child: Center(
                                                child: Container(
                                                  height: 50.h,
                                                  width: 50.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: Icon(
                                                    color: ThemeConstents
                                                        .appPrimeryColor,
                                                    Icons.camera_alt_outlined,
                                                    size: 40.sp,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : null,
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          AccountFormField(
                            controller:
                                accountScreenViewModel.firstNameController,
                            hintText: "Name",
                            keyboardtype: TextInputType.name,
                            status: accountScreenViewModel.isEditting,
                          ),
                          InputFormPhFieldWidget(
                              invalidNumberMessage: "Enter Mobile Number",
                              enabled: accountScreenViewModel.isEditting,
                              fieldPadding: EdgeInsets.zero,
                              labelText: "Mobile Number",
                              controller:
                                  accountScreenViewModel.phoneController),
                          SizedBox(
                            height: 20.h,
                          ),
                          InputFormPhFieldWidget(
                              enabled: accountScreenViewModel.isEditting,
                              fieldPadding: EdgeInsets.zero,
                              labelText: "Whatsup Number",
                              controller:
                                  accountScreenViewModel.whatsappController),
                          SizedBox(
                            height: 20.h,
                          ),
                          FixedFormField(
                              padding: EdgeInsets.zero,
                              labelText: "Email",
                              initialvalue: accountScreenViewModel
                                  .emailController.text
                                  .toString()),
                          Consumer<AccountScreenViewModel>(
                              builder: (context, accountScreenViewModel, _) {
                            if (accountScreenViewModel.accountgender
                                .toString()
                                .isNotEmpty) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: 25.h, bottom: 15.h),
                                child: FormBuilderRadioGroup(
                                  activeColor: ThemeConstents.appPrimeryColor,
                                  enabled: accountScreenViewModel.isEditting,
                                  onChanged: (newValue) {
                                    accountScreenViewModel.isEditting
                                        ? accountScreenViewModel
                                            .changeaccountgender(newValue)
                                        : null;
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        fontSize: 18.sp,
                                        color: ThemeConstents.appBodyBlack),
                                    labelText: "Genter",
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                  ),
                                  orientation: OptionsOrientation.horizontal,
                                  name: "Genter",
                                  validator: FormBuilderValidators.required(),
                                  initialValue:
                                      accountScreenViewModel.accountgender,
                                  options: ['Male', 'Female'].map((gender) {
                                    return FormBuilderFieldOption(
                                        value: gender);
                                  }).toList(growable: false),
                                ),
                              );
                            }
                            return const SizedBox();
                          }),
                          Consumer<AccountScreenViewModel>(
                            builder: (context, accountScreenViewModel, _) {
                              return AccountFormField(
                                controller: accountScreenViewModel
                                    .dateOfBirthController,
                                readOnly: true,
                                onTap: () {
                                  accountScreenViewModel.isEditting
                                      ? accountScreenViewModel
                                          .takeDateOfBirth(context)
                                      : null;
                                },
                                hintText: "Date Of Birth",
                                keyboardtype: TextInputType.none,
                                status: accountScreenViewModel.isEditting,
                              );
                            },
                          ),
                          AccountFormField(
                            maxLines: 3,
                            controller:
                                accountScreenViewModel.nativeAdressController,
                            hintText: "Native Adress",
                            keyboardtype: TextInputType.name,
                            status: accountScreenViewModel.isEditting,
                          ),
                          AccountFormField(
                            controller:
                                accountScreenViewModel.pinCodeController,
                            validation: (value) {
                              return facultyViewModel.otpValidation(value);
                            },
                            hintText: "Pincode",
                            keyboardtype: TextInputType.number,
                            status: accountScreenViewModel.isEditting,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonWidget(
                                  buttonname: "Edit",
                                  height: 34.h,
                                  width: 114.w,
                                  onclick: () {
                                    accountScreenViewModel.isEditting
                                        ? null
                                        : accountScreenViewModel
                                            .changeaccountfieldstatus();
                                  },
                                ),
                                Visibility(
                                  visible: accountScreenViewModel.isEditting,
                                  child: ButtonWidget(
                                    isLoading: accountScreenViewModel.isSaving,
                                    buttonname: "Save",
                                    height: 34.h,
                                    width: 114.w,
                                    onclick: () {
                                      !accountScreenViewModel.isSaving
                                          ? accountScreenViewModel
                                              .saveDetails(context)
                                          : null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          } else {
            return RefreshIndicator(
              onRefresh: () => accountScreenViewModel.getAccountData(context),
              child: ListView(
                padding: EdgeInsets.only(top: .4.sh),
                children: [
                  const Center(child: Text("No Internet")),
                  Center(
                    child: ElevatedButton(
                        onPressed: () =>
                            accountScreenViewModel.getAccountData(context),
                        child: const Text("Try again")),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

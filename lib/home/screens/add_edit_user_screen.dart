import 'package:charlie/helpers/custom_toasts.dart';
import 'package:charlie/home/view_models/add_edit_user_view_model.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:charlie/widgets/buttons/custom_button.dart';
import 'package:charlie/widgets/containers/app_card.dart';
import 'package:charlie/widgets/containers/app_safe_area.dart';
import 'package:charlie/widgets/input/rich_text_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:provider/provider.dart';

class AddEditUserScreen extends StatefulWidget {
  const AddEditUserScreen({super.key});

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final addEditUserViewModel =
          Provider.of<AddEditUserViewModel>(context, listen: false);
      addEditUserViewModel.init(formKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddEditUserViewModel>(
        builder: (context, addEditUserVM, child) {
      return AppSafeArea(
          child: Scaffold(
        backgroundColor: AppColors.scaffold,
        appBar: const CustomAppBar(
          title: "Add new user",
        ),
        body: AppCard(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    RichTextField(
                      controller: addEditUserVM.firstNameController,
                      required: true,
                      label: "first_name",
                      validator: (val) {
                        return addEditUserVM.firstNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.lastNameController,
                      label: "last_name",
                      required: true,
                      validator: (val) {
                        return addEditUserVM.pictureLinkIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.emailController,
                      label: "email",
                      required: true,
                      validator: (val) {
                        return addEditUserVM.emailIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.birthDateController,
                      label: "date_of_birth",
                      readOnly: true,
                      onTap: () {
                        addEditUserVM.selectDate(context);
                      },
                      required: true,
                      validator: (val) {
                        return addEditUserVM.birthDateIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.streetNumberController,
                      label: "street_number",
                      required: true,
                      validator: (val) {
                        return addEditUserVM.streetNumberIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.streetNameController,
                      label: "street_name",
                      required: true,
                      validator: (val) {
                        return addEditUserVM.streetNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.cityNameController,
                      label: "city",
                      required: true,
                      validator: (val) {
                        return addEditUserVM.cityNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.countryNameController,
                      label: "country",
                      readOnly: true,
                      onTap: () {
                        addEditUserVM.selectCountry(context);
                      },
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.grey172,
                      ),
                      required: true,
                      validator: (val) {
                        return addEditUserVM.countryNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 8),
                    RichTextField(
                      controller: addEditUserVM.pictureLinkController,
                      label: "picture",
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textToShow: "Save",
                      onTap: () {
                        addEditUserVM.saveUser((res) {
                          if (res) {
                            Get.back();
                            successToast("user_saved_successfully");
                          } else {
                            errorToast();
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}

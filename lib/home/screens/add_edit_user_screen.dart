import 'package:charlie/helpers/custom_toasts.dart';
import 'package:charlie/helpers/ui_helper.dart';
import 'package:charlie/home/view_models/add_edit_user_view_model.dart';
import 'package:charlie/home/widgets/gender_select.dart';
import 'package:charlie/them/colors.dart';
import 'package:charlie/widgets/app_bars/custom_app_bar.dart';
import 'package:charlie/widgets/buttons/custom_button.dart';
import 'package:charlie/widgets/buttons/selectable_button.dart';
import 'package:charlie/widgets/containers/app_card.dart';
import 'package:charlie/widgets/containers/app_safe_area.dart';
import 'package:charlie/widgets/input/rich_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charlie/translations/translation_keys.dart' as tran;
import 'package:provider/provider.dart';
import 'package:charlie/utils/constants.dart' as constant;

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

  saveNewUser(AddEditUserViewModel addEditUserVM) {
    keyBoardDispose(context);
    if (!addEditUserVM.loading) {
      addEditUserVM.saveUser((res, userRes) {
        if (res == true) {
          Get.back();
          successToast("user_saved_successfully");
        } else {
          errorToast();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddEditUserViewModel>(
        builder: (context, addEditUserVM, child) {
      return AppSafeArea(
          child: Scaffold(
        backgroundColor: AppColors.scaffold,
        appBar: CustomAppBar(
          title: "add_new_user".tr,
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
                    Row(
                      children: [
                        Text(
                          tran.title.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const Text(
                          ' *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.red201),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 8,
                      runSpacing: 8,
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: List<Widget>.generate(
                          constant.titles.length,
                          (index) => SelectableButton(
                                selected: constant.titles[index] ==
                                    addEditUserVM.title,
                                text: constant.titles[index],
                                onTap: () => addEditUserVM
                                    .selectTitle(constant.titles[index]),
                              )),
                    ),
                    const SizedBox(height: 12),
                    RichTextField(
                      controller: addEditUserVM.firstNameController,
                      required: true,
                      label: "first_name".tr,
                      textCapitalization: TextCapitalization.words,
                      validator: (val) {
                        return addEditUserVM.firstNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 12),
                    RichTextField(
                      controller: addEditUserVM.lastNameController,
                      label: "last_name".tr,
                      textCapitalization: TextCapitalization.words,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.lastNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        GenderSelect(
                          selected: addEditUserVM.isMale,
                          onTap: () => addEditUserVM.setGender(constant.male),
                          isMale: true,
                        ),
                        const SizedBox(width: 12),
                        GenderSelect(
                          selected: addEditUserVM.isFemale,
                          onTap: () => addEditUserVM.setGender(constant.female),
                          isMale: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 12),
                    RichTextField(
                      controller: addEditUserVM.streetNameController,
                      label: "street_name",
                      textCapitalization: TextCapitalization.words,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.streetNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 12),
                    RichTextField(
                      controller: addEditUserVM.cityNameController,
                      label: "city",
                      textCapitalization: TextCapitalization.words,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.cityNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 12),
                    RichTextField(
                      controller: addEditUserVM.pictureLinkController,
                      label: "picture",
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textToShow: "Save",
                      loading: addEditUserVM.loading,
                      onTap: () {
                        saveNewUser(addEditUserVM);
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

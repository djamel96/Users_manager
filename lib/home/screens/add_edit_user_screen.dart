import 'package:charlie/favorite/view_models/favorite_view_model.dart';
import 'package:charlie/helpers/custom_toasts.dart';
import 'package:charlie/helpers/ui_helper.dart';
import 'package:charlie/home/view_models/add_edit_user_view_model.dart';
import 'package:charlie/home/view_models/home_view_model.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
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
  final UserViewModel? userViewModel;
  const AddEditUserScreen({super.key, this.userViewModel});

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
      if (widget.userViewModel == null) {
        addEditUserViewModel.init(formKey);
      } else {
        addEditUserViewModel.initEditUser(formKey, widget.userViewModel!);
      }
    });
  }

  saveNewUser(AddEditUserViewModel addEditUserVM) {
    keyBoardDispose(context);
    if (!addEditUserVM.loading) {
      addEditUserVM.saveUser((res, userRes) {
        if (res == true) {
          Get.back();
          reloadUsers();
          successToast(tran.userSavedSuccessfully.tr);
        } else {
          errorToast();
        }
      });
    }
  }

  updateUser(AddEditUserViewModel addEditUserVM) {
    keyBoardDispose(context);
    if (!addEditUserVM.loading) {
      addEditUserVM.updateUser(widget.userViewModel!, (res, userRes) {
        if (res == true) {
          Get.back();
          reloadUsers();
          reloadFavorite();
          successToast(tran.userUpdatedSuccessfully.tr);
        } else {
          errorToast();
        }
      });
    }
  }

  reloadUsers() {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.loadUsersList();
  }

  reloadFavorite() {
    final favoriteViewModel =
        Provider.of<FavoriteViewModel>(context, listen: false);
    favoriteViewModel.loadFavoriteUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddEditUserViewModel>(
        builder: (context, addEditUserVM, child) {
      return AppSafeArea(
          child: Scaffold(
        backgroundColor: AppColors.scaffold,
        appBar: CustomAppBar(
          title: tran.addNewUser.tr,
        ),
        body: AppCard(
          margin: const EdgeInsets.all(constant.margin),
          padding: EdgeInsets.zero,
          child: ListView(
            padding: const EdgeInsets.all(constant.padding),
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
                      spacing: 8,
                      runSpacing: 8,
                      children: List<Widget>.generate(
                          addEditUserVM.titles.length,
                          (index) => SelectableButton(
                                selected: addEditUserVM.titles[index] ==
                                    addEditUserVM.title,
                                text: addEditUserVM.titles[index],
                                onTap: () => addEditUserVM
                                    .selectTitle(addEditUserVM.titles[index]),
                              )),
                    ),
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.firstNameController,
                      required: true,
                      label: tran.firstName.tr,
                      textCapitalization: TextCapitalization.words,
                      validator: (val) {
                        return addEditUserVM.firstNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.lastNameController,
                      label: tran.lastName.tr,
                      textCapitalization: TextCapitalization.words,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.lastNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: constant.spaceInForm),
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
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.emailController,
                      label: tran.email.tr,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.emailIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.birthDateController,
                      label: tran.dateOfBirth.tr,
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
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.streetNumberController,
                      label: tran.streetNumber.tr,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.streetNumberIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.streetNameController,
                      label: tran.streetName.tr,
                      textCapitalization: TextCapitalization.words,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.streetNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.cityNameController,
                      label: tran.city.tr,
                      textCapitalization: TextCapitalization.words,
                      required: true,
                      validator: (val) {
                        return addEditUserVM.cityNameIsValid
                            ? null
                            : tran.pleaseEnterValue;
                      },
                    ),
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.countryNameController,
                      label: tran.country.tr,
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
                    const SizedBox(height: constant.spaceInForm),
                    RichTextField(
                      controller: addEditUserVM.pictureLinkController,
                      label: tran.picture.tr,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textToShow: tran.save.tr,
                      loading: addEditUserVM.loading,
                      onTap: () {
                        if (widget.userViewModel == null) {
                          saveNewUser(addEditUserVM);
                        } else {
                          updateUser(addEditUserVM);
                        }
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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/spot_sold_success/spot_sold_success_view.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_radio.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:kreyno/ui/widgets/smart/date_picker_field/birth_date_picker_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_profile_viewmodel.dart';

class EditProfileView extends StackedView<EditProfileViewModel> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.px24, vertical: AppSpacing.px20)
              .copyWith(bottom: AppSpacing.px32),
          child: CustomButton.filled(
              onPressed: () {}, text: "Enregistrer les modifications")),
      appBar: MyAppBar(title: "Modifier mon profil"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              VGap(
                AppSpacing.px20,
              ),
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://picsum.photos/300/300"),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black38,
                  child: CustomIcon(
                    iconPath: AppIcons.camera,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              VGap(AppSpacing.px8),
              const CustomText.smallParagraphMedium("Changer la photo"),
              VGap(AppSpacing.px24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InputField(
                              controller: TextEditingController(),
                              focusNode: FocusNode(),
                              labelText: "Nom",
                              hintText: "Nom",
                              keyboardType: TextInputType.text),
                        ),
                        HGap(AppSpacing.px12),
                        Expanded(
                          child: InputField(
                              controller: TextEditingController(),
                              focusNode: FocusNode(),
                              labelText: "Prenom",
                              hintText: "Prenom",
                              keyboardType: TextInputType.text),
                        )
                      ],
                    ),
                    VGap(AppSpacing.px16),
                    InputField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Nom d’utilisateur",
                        hintText: "Ex: johndoe22",
                        keyboardType: TextInputType.text),
                    VGap(AppSpacing.px16),
                    InputField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Email",
                        hintText: "Ex: JohnDoe@gmail.com",
                        keyboardType: TextInputType.text),
                    VGap(AppSpacing.px16),
                    InputField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Numéro de téléphone",
                        hintText: "Ex: +33484883",
                        keyboardType: TextInputType.text),
                    VGap(AppSpacing.px16),
                    InputField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Adresse postale",
                        hintText: "Votre Address",
                        keyboardType: TextInputType.text),
                    VGap(AppSpacing.px16),
                    BirthDatePickerField(
                        labelText: "Date de naissance",
                        onBirthdayChanged: (f) {}),
                    VGap(AppSpacing.px16),
                    const CustomText.smallParagraphMedium(
                      "Sex",
                      color: AppColors.textKre,
                    ),
                    VGap(AppSpacing.px1 * 6),
                    Row(
                      children: [
                        Expanded(
                          child: LabeledCheckbox(
                              label: "Homme",
                              value: viewModel.sexe == "male",
                              onChanged: (f) {
                                viewModel.sexChanged("male");
                              }),
                        ),
                        Expanded(
                          child: LabeledCheckbox(
                              label: "Femme",
                              value: viewModel.sexe == "female",
                              onChanged: (f) {
                                viewModel.sexChanged("female");
                              }),
                        )
                      ],
                    ),
                    VGap(AppSpacing.px20),

                    // CustomButton.filled(
                    //   text: "Enregistrer les modifications",
                    //   onPressed: () {},
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel();
}

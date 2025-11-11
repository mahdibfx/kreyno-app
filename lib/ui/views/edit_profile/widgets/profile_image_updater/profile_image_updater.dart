import 'package:flutter/material.dart';
import 'package:kreyno/ui/views/edit_profile/widgets/profile_image_updater/widgets/no_profile_image_state.dart';
import 'package:kreyno/ui/views/edit_profile/widgets/profile_image_updater/widgets/profile_image_exists_state.dart';
import 'package:stacked/stacked.dart';

import 'profile_image_updater_model.dart';

class ProfileImageUpdater extends StackedView<ProfileImageUpdaterModel> {
  const ProfileImageUpdater({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileImageUpdaterModel viewModel,
    Widget? child,
  ) {
    if (viewModel.currentAvatar == null) {
      return const NoProfileImageState();
    } else {
      return const ProfileImageExistsState();
    }
  }

  @override
  ProfileImageUpdaterModel viewModelBuilder(BuildContext context) =>
      ProfileImageUpdaterModel();
}

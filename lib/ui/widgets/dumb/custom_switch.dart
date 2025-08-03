import 'package:flutter/cupertino.dart';

import '../../common/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .85,
      alignment: Alignment.centerRight,
      child: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.greenKre,
        inactiveTrackColor: AppColors.strokeKre,
        thumbColor: AppColors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

/// A drop-in replacement for stacked's [BottomSheetService] that presents
/// custom sheets with Flutter's native [showModalBottomSheet] instead of
/// GetX's `Get.bottomSheet`.
///
/// Why: stacked_services builds bottom sheets on top of GetX's
/// `GetModalBottomSheetRoute`. That route positions the sheet from its
/// *primary* route animation only and does not handle being covered by a
/// pushed route and revealed again on pop. The result is that any sheet that
/// navigates to a full screen (e.g. the "choose place" picker) and comes back
/// becomes completely unresponsive to taps. Flutter's native modal bottom
/// sheet handles the secondary animation / reveal correctly, so taps keep
/// working after returning from a pushed route.
///
/// The public surface used across the app ([setCustomSheetBuilders] and
/// [showCustomSheet]) is preserved, so every existing call site keeps working
/// unchanged.
class AppBottomSheetService extends BottomSheetService {
  Map<dynamic, SheetBuilder> _builders = {};

  @override
  void setCustomSheetBuilders(Map<dynamic, SheetBuilder> builders) {
    _builders = {..._builders, ...builders};
    super.setCustomSheetBuilders(builders);
  }

  @override
  Future<SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool hasImage = false,
    String? imageUrl,
    bool showIconInMainButton = false,
    String? mainButtonTitle,
    bool showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool takesInput = false,
    Color barrierColor = Colors.black54,
    double elevation = 1,
    bool barrierDismissible = true,
    bool isScrollControlled = false,
    String barrierLabel = '',
    // ignore: deprecated_member_use
    @Deprecated('Use `data` and pass in a generic type.') dynamic customData,
    R? data,
    bool enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool useRootNavigator = false,
  }) {
    final sheetBuilder = _builders[variant];
    assert(
      sheetBuilder != null,
      'There is no sheet builder supplied for the variant: $variant. '
      'Make sure setCustomSheetBuilders has been called with a builder for it.',
    );

    final context = StackedService.navigatorKey!.currentContext!;

    return showModalBottomSheet<SheetResponse<T>>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: barrierDismissible,
      enableDrag: barrierDismissible && enableDrag,
      barrierColor: barrierColor,
      elevation: elevation,
      useRootNavigator: useRootNavigator,
      // The sheets bring their own background/rounding via BottomSheetLayout.
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Padding(
          // Mirror GetX's behaviour: lift the sheet above the keyboard.
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: sheetBuilder!(
              sheetContext,
              SheetRequest<R>(
                title: title,
                description: description,
                hasImage: hasImage,
                imageUrl: imageUrl,
                showIconInMainButton: showIconInMainButton,
                mainButtonTitle: mainButtonTitle,
                showIconInSecondaryButton: showIconInSecondaryButton,
                secondaryButtonTitle: secondaryButtonTitle,
                showIconInAdditionalButton: showIconInAdditionalButton,
                additionalButtonTitle: additionalButtonTitle,
                takesInput: takesInput,
                // ignore: deprecated_member_use
                customData: customData,
                variant: variant,
                data: data,
              ),
              (SheetResponse<dynamic> response) {
                if (Navigator.of(sheetContext).canPop()) {
                  Navigator.of(sheetContext).pop(response);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

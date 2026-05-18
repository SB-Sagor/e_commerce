import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final _userController = UserController.instance;
  final _userRepository = UserRepository.instance;

  final updateUserFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  void initializeName() {
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      UFullScreenLoader.openLoadingDialog(
        'We are updating your information.....',
        UImages.loading,
      );

      //check internet
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      //check validity
      if (!updateUserFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // //update user name
      // _userRepository.updateSingleField({
      //   'firstName': firstName.text,
      //   'lastName': lastName.text,
      // });
      // Update User Name From Fire store
      Map<String, dynamic> map = {
        'FirstName': firstName.text,//it was firstName in you
        'LastName': lastName.text,//it was lastName in you
      };
      await _userRepository.updateSingleField(map);

      // Update user from RX User
      _userController.user.value.firstName = firstName.text.trim();
      _userController.user.value.lastName = lastName.text.trim();
      _userController.user.refresh();

      // Stop Loading
      UFullScreenLoader.stopLoading();
      //redirect page
      Get.offAll(() => NavigationMenu());

      // Success Message
      USnackBarHelpers.successSnackBar(
        title: "Congratulation",
        message: 'Your name has been updated',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Update Name Failed',
        message: e.toString(),
      );
    }
  }
}

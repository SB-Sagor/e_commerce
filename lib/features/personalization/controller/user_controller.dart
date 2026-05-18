import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      // Convert Full Name to FirstName & LastName
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final username = '${userCredential.user!.displayName}009';
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParts[0],
        // Unknown
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
      );
      await _userRepository.saveUserRecord(userModel);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Data Not Saved!');
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user.value = user;
      // this.user(user)
    } catch (e) {
      user(UserModel.empty());
    }finally{
      profileLoading.value=false;
    }
  }
}

import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class UBindings extends Bindings{

  @override
  void dependencies(){
Get.put(NetworkManager());
  }
}
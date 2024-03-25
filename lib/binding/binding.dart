import 'package:get/get.dart';

import '../controller/WishlistPage_controller.dart';
import '../controller/cartpage_controller.dart';
import '../controller/homepagecontroller.dart';

class RootBinding implements Bindings{
@override
  void dependencies(){
Get.put(HomePageController());
Get.put(WishlistController());
Get.put(WishlistController());

}
}
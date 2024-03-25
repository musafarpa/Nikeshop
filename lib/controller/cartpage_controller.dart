import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // Import get_storage
import '../model/nike.dart';

class CartPageController extends GetxController {
  List<nikemodel> cartItems = <nikemodel>[].obs; // Convert to observable

  final box = GetStorage(); // Initialize get_storage instance

  @override
  void onInit() {
    super.onInit();
    // Initialize cartItems as observable list
    cartItems = <nikemodel>[].obs;

    // Retrieve stored cartItems from get_storage when the controller is initialized
    List<dynamic>? storedItems = box.read('cartItems');
    if (storedItems != null) {
      cartItems.assignAll(storedItems.map((item) => nikemodel.fromJson(item)).toList());
    }
  }

  void addToCart(nikemodel item) {
    cartItems.add(item);
    // Save updated cartItems to get_storage
    box.write('cartItems', cartItems.map((item) => item.toJson()).toList());
    update(); // Update the state
  }

  void removeFromCart(nikemodel item) {
    cartItems.remove(item);
    // Update the storage if you are using GetStorage
    box.write('cartItems', cartItems.map((item) => item.toJson()).toList());
    update(); // Update the state
  }

  void clearCart() {
    cartItems.clear();
    // Clear cartItems in get_storage
    box.remove('cartItems');
    update(); // Update the state
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (nikemodel item in cartItems) {
      total += double.parse(item.price);
    }
    return total;
  }


}

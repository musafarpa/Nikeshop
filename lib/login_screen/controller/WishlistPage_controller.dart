import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistController extends GetxController {
  RxList<Map<String, dynamic>> wishlistItems = <Map<String, dynamic>>[].obs;
  final box = GetStorage('wishlist'); // Initialize get_storage instance with box name

  @override
  void onInit() {
    super.onInit();
    // Load wishlist items from storage when the controller is initialized
    _loadWishlistItems();
  }

  Future<void> _loadWishlistItems() async {
    List<dynamic>? storedItems = box.read<List>('items');
    if (storedItems != null) {
      wishlistItems.assignAll(storedItems.cast<Map<String, dynamic>>());
    }
  }

  void addToWishlist(String itemName, String itemImage, String price,List <String> size, ) async {
    wishlistItems.add({
      'item': itemName,
      'image': itemImage,
      'price': price,
      'size':size,
      // 'description':description,
      // 'price1':price1,

    });

    // Save wishlist items to storage
    await box.write('items', wishlistItems.toList());

    // Show a Snackbar
    Get.snackbar(
      'Wishlist',
      '$itemName added to wishlist',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(milliseconds: 700),
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }

  void removeFromWishlist(String itemName) async {
    wishlistItems.removeWhere((item) => item['item'] == itemName);

    // Save updated wishlist items to storage
    await box.write('items', wishlistItems.toList());
  }
}

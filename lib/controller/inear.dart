// import 'package:add_to_cart_animation/add_to_cart_icon.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import '../model/nike.dart';
// import '../screen/Inear_Home.dart';
// import '../screen/cartpage.dart';
// import 'WishlistPage_controller.dart';
// import 'cartpage_controller.dart';
//
// class InearhomeController extends GetxController {
//   final CartPageController cartController = Get.put(CartPageController());
//   final WishlistController wishlistController = Get.put(WishlistController());
//
//   int selectedSizeIndex = -0;
//   var _cartQuantityItems = 0;
//
//
//   void addtocart() async {
//     await runAddToCartAnimation(widgetKey);
//
//     // Validate if a size is selected before adding to the cart
//     if (selectedSizeIndex != -1) {
//       // Create an instance of nikemodel with the current product details
//       var widget;
//       nikemodel product = nikemodel(
//         imageUrl: widget.images,
//         text: widget.texts,
//         text1: widget.texts1,
//         text2: widget.texts2,
//         text3: widget.texts3,
//         // Include the selected size in the product model
//         size: [widget.size[selectedSizeIndex]],
//       );
//
//       Add the entire product model to the cart
//       var cartKey;
//       cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());
//       cartController.addToCart(product);
//       Get.to (CartPage());
//     } else {
//       // Inform the user that a size needs to be selected
//       // You may show a Snackbar, Toast, or any other feedback mechanism
//       print('Please select a size before adding to the cart.');
//     }
//   }
//
//   runAddToCartAnimation(GlobalKey<State<StatefulWidget>> widgetKey) {}
// }

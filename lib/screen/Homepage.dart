import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/WishlistPage_controller.dart';
import '../controller/cartpage_controller.dart';
import '../controller/homepagecontroller.dart';
import '../model/nike.dart';
import 'Inear_Home.dart';
import 'pages/cartpage.dart';




class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  nikemodel? selectedItem;
  int selectedSizeIndex = -0;
  final HomePageController _homePageController = Get.put(HomePageController());
  final WishlistController wishlistController = Get.put(WishlistController());
  final CartPageController cartController = Get.put(CartPageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Center(
          child: Image.network(
            'https://cdn.freebiesupply.com/logos/large/2x/nike-4-logo-black-and-white.png',
            width: 80,
            height: 300,
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                shrinkWrap: true,
                itemCount: _homePageController.nikedata.length,
                itemBuilder: (context, index) {
                  final item = _homePageController.nikedata[index];
                  // final bgColor = colors[index % colors.length];
                  return InkWell(
                    onTap: () {
                      Get.to(Inearhome(
                        index: index,
                        texts: _homePageController.nikedata[index].text,
                        texts1:_homePageController.nikedata[index].text1,
                        texts2:_homePageController.nikedata[index].price,
                        texts3:_homePageController.nikedata[index].text3,
                        size:_homePageController.nikedata[index].size,
                        images: _homePageController.nikedata[index].imageUrl ?? [],

                      ));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 360,
                          width: 400,
                      margin: EdgeInsets.only(bottom: 18),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                      item.imageUrl.first.toString() ?? '',  // Use toString() to ensure it's a String or an empty string if null
                      fit: BoxFit.cover,
                    )
                      ),
                    ),
                        Positioned(
                          bottom:37,
                            left: 20,
                            right: 20,
                            child: Container(
                              height: 100,
                              child: Center(
                                child: Text(item.text ?? '',
                                    style: GoogleFonts.aboreto(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w800)),
                              ),
                            )
                        ),
                        Positioned(
                          bottom: 14,
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 8), // Add some spacing between the icon and text
                                Text(
                                  '\₹${item.text1 ?? ''}',
                                  style: GoogleFonts.aboreto(
                                    color: Colors.redAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -11,
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 8), // Add some spacing between the icon and text
                                Text(
                                  '\₹${item.price ?? ''}',
                                  style: GoogleFonts.aboreto(
                                    color: Colors.redAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          left: 5,
                          right: 20,
                          child: Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: wishlistController.wishlistItems
                                        .any((element) => element['item'] == _homePageController.nikedata[index].text)
                                        ? Colors.white // Change this to the color when in wishlist
                                        : Colors.white,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      wishlistController.wishlistItems
                                          .any((element) => element['item'] == _homePageController.nikedata[index].text)
                                          ? Icons.favorite // Change this to the icon when in wishlist
                                          : Icons.favorite_outline_rounded, color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Add to or remove from wishlist based on the current state
                                      if (wishlistController.wishlistItems
                                          .any((element) => element['item'] == _homePageController.nikedata[index].text)) {
                                        wishlistController.removeFromWishlist(_homePageController.nikedata[index].text);
                                      } else {
                                        wishlistController.addToWishlist(
                                          _homePageController.nikedata[index].text,
                                          item.imageUrl.first.toString() ?? '', // Assuming you want to use the first image
                                          _homePageController.nikedata[index].price, // Assuming you want to use the description
                                          _homePageController.nikedata[index].size.toList() , // Assuming you want to use the description
                                        );
                                      }
                                    },
                                  ),
                                )),

                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 1,

                          right:9,
                          child: Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ... existing code ...
                                IconButton(
                                  icon: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    size: 27,
                                  ),
                                  onPressed: () {
                                    // Call the addtocart function with the selected item
                                    // addtocart(item);
                                    showSizeBottomSheet(item);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
            ],
        ),
      ),
    );
  }



  void addtocart(nikemodel selectedItem) async {
    // Validate if a size is selected before adding to the cart
    if (selectedSizeIndex != -1) {
      // Create an instance of nikemodel with the current product details
      nikemodel product = nikemodel(
        imageUrl: selectedItem.imageUrl,
        text: selectedItem.text,
        text1: selectedItem.text1,
        price: selectedItem.price,
        text3: selectedItem.text3,
        // Include the selected size in the product model
        size: [selectedItem.size[selectedSizeIndex]],
      );

      // Add the entire product model to the cart
      cartController.addToCart(product);
      Get.to(CartPage());
    } else {
      // Inform the user that a size needs to be selected
      // You may show a Snackbar, Toast, or any other feedback mechanism
      print('Please select a size before adding to the cart.');
    }
  }



  void showSizeBottomSheet(nikemodel selectedItem) {
    Get.bottomSheet(
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add widgets to select size here
              // For example, you can use RadioButtons or any other UI elements
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  selectedItem.size.length,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSizeIndex = index;
                      });
                      print('Selected Size: ${selectedItem.size[index]}');
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedSizeIndex == index
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        selectedItem.size[index],
                        style: TextStyle(
                          color: selectedSizeIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate if a size is selected before adding to the cart
                  if (selectedSizeIndex != -1) {
                    // Call the addtocart function with the selected item
                    addtocart(selectedItem);
                  } else {
                    // Inform the user that a size needs to be selected
                    // You may show a Snackbar, Toast, or any other feedback mechanism
                    print('Please select a size before adding to the cart.');
                  }
                  // Get.back();
                  addtocart;
                  // Close the bottom sheet
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }





}

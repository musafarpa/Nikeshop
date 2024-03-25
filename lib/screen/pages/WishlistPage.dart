import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/WishlistPage_controller.dart';
import '../Inear_Home.dart';

class WishlistPage extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: Obx(() => ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        itemCount: wishlistController.wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistController.wishlistItems[index];
          return Container(
            padding: EdgeInsets.only(bottom: 15),
            height: 150,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 13, bottom: 5, top: 32, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Inearhome page with the selected item details
                      Get.to(
                            () => Inearhome(
                          texts: item['item'],
                          images: [item['image']],
                          texts1: item['text1'] ?? '', // If 'texts1' is null, default to an empty string
                          texts2: '${item['price']}',
                          texts3: item['text3'] ?? '', // If 'texts3' is null, default to an empty string
                          size: item['size'] ?? [], // If 'size' is null, default to an empty list
                        ),
                      );

                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(item['image'], fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['item'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        '₹${item['price']}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Trigger the deletion of the item
                      wishlistController.removeFromWishlist(item['item']);
                      // Show a Snackbar indicating deletion
                      Get.snackbar(
                        'Wishlist',
                        '${item['item']} removed from wishlist',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}

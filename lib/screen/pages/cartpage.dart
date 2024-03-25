

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/cartpage_controller.dart';
import '../../model/nike.dart';

class CartPage extends StatelessWidget {
  final CartPageController cartController = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
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
        body: GetBuilder<CartPageController>(
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      final nikemodel item = controller.cartItems[index];

                      String firstImageUrl = item.imageUrl.isNotEmpty ? item.imageUrl[0] : '';

                      return ListTile(
                        title: Text(item.text),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (firstImageUrl.isNotEmpty) Image.network(firstImageUrl, height: 250),
                            Text('Size: ${item.size.first}'),
                            Text('Price: ₹${item.price}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            print('Removing item: ${item.text}');
                            controller.removeFromCart(item);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text('Item 1 Price: ₹${controller.cartItems[0].price}'),
                      //     Text('Item 2 Price: ₹${controller.cartItems[1].price}'),
                      //   ],
                      // ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Price: ₹${controller.calculateTotalPrice()}'),
                          ElevatedButton(
                            onPressed: () {
                              // Handle the buy now action
                              print('Buy Now button pressed');
                              // Add your logic to complete the purchase
                            },
                            child: Text('Buy Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/WishlistPage_controller.dart';
import '../controller/cartpage_controller.dart';
import '../controller/homepagecontroller.dart';
import '../controller/inear.dart';
import '../model/nike.dart';
import 'profileview.dart';
import 'pages/cartpage.dart';

class Inearhome extends StatefulWidget {
  final texts;
  final List<String> images;
  final index;
  final texts1;
  final texts2;
  final texts3;
  final size;

  const Inearhome({
    Key? key,
    this.texts,
    required this.images,
    this.index,
    this.texts1,
    this.texts2, this.texts3,
    this.size,
  }) : super(key: key);

  @override
  State<Inearhome> createState() => _InearhomeState();
}
final GlobalKey widgetKey = GlobalKey();
class _InearhomeState extends State<Inearhome> {
  int quantity = 1;


  int selectedSizeIndex = -0;
// Initialize with no selected size
  final CartPageController cartController = Get.put(CartPageController());
  final HomePageController _homePageController = Get.put(HomePageController());
  final WishlistController wishlistController = Get.put(WishlistController());
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  @override
  Widget build(BuildContext context) {
    return   AddToCartAnimation(
      // To send the library the location of the Cart icon
      cartKey: cartKey,
      height: 0,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        duration: Duration(seconds: 1),
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
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
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 350,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(seconds: 5),
                      viewportFraction: 0.8,
                      initialPage: 0,
                    ),
                    items: (widget.images ?? []).map((imageurl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            // key: widgetKey,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                imageurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    key: widgetKey,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        widget.images[0],
                        height: 100,
                        width: 10,
                      ),
                    ),
                  ),
                  ListTile(
                      leading: Text(
                        widget.texts,
                        style: GoogleFonts.adamina(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        '\₹${widget.texts1 ?? ''}',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 270, bottom: 30),
                        child: Text(
                          '\₹${widget.texts2 ?? ''}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AVAILABLE SIZE", style: GoogleFonts.poppins()),
                      SizedBox(width: 10,),
                      Image.asset(
                        'assets/11.png',
                        height: 26,
                      ),
                    ],),
                  // Center(child: Text("AVAILABLE SIZE", style: GoogleFonts.poppins())),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      widget.size.length,
                          (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                          print('Selected Size: ${widget.size[index]}');
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
                            widget.size[index],
                            style: TextStyle(
                              color: selectedSizeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("DESCRIPTION",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15)),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Text(widget.texts3,),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 90,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(() => Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: wishlistController.wishlistItems
                                          .any((element) => element['item'] == widget.texts)
                                          ? Colors.white // Change this to the color when in wishlist
                                          : Colors.white,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        wishlistController.wishlistItems
                                            .any((element) => element['item'] == widget.texts)
                                            ? Icons.favorite // Change this to the icon when in wishlist
                                            : Icons.favorite_outline_rounded, color: Colors.black,
                                      ),
                                      onPressed: () {
                                        // Add to or remove from wishlist based on the current state
                                        if (wishlistController.wishlistItems
                                            .any((element) => element['item'] == widget.texts)) {
                                          wishlistController.removeFromWishlist(widget.texts);
                                        } else {
                                          wishlistController.addToWishlist(
                                            widget.texts,
                                            widget.images.first, // Assuming you want to use the first image
                                            widget.texts2, // Assuming you want to use the description
                                            widget.size, // Assuming you want to use the description
                                          );
                                        }
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            ),

                            SizedBox(width: 100,),SizedBox(
                              height: 50,
                              width: 50,
                              child: GestureDetector(
                                onTap: () {
                                  listClick();
                                  addtocart();
                                },
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: AddToCartIcon(
                                          key: cartKey,
                                          icon: const Icon(Icons.add_shopping_cart_outlined,),
                                          badgeOptions: const BadgeOptions(
                                            active: true,
                                            fontSize: 12,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      )

                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
  void listClick() async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((_cartQuantityItems).toString());

  }
  // Add to cart function

  void addtocart() async {
    await runAddToCartAnimation(widgetKey);

    // Validate if a size is selected before adding to the cart
    if (selectedSizeIndex != -1) {
      // Create an instance of nikemodel with the current product details
      nikemodel product = nikemodel(
        imageUrl: widget.images,
        text: widget.texts,
        text1: widget.texts1,
        price: widget.texts2,
        text3: widget.texts3,
        // Include the selected size in the product model
        size: [widget.size[selectedSizeIndex]],
      );

      // Add the entire product model to the cart
      cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());
      cartController.addToCart(product);
      Get.to (CartPage());
    } else {
      // Inform the user that a size needs to be selected
      // You may show a Snackbar, Toast, or any other feedback mechanism
      print('Please select a size before adding to the cart.');
    }

  }

}
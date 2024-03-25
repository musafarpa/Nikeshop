import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/nike.dart';
import '../screen/Homepage.dart';
import '../screen/Search.dart';
import '../screen/pages/WishlistPage.dart';
import '../screen/profileview.dart';
import '../screen/pages/cartpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    Homepage(),
    Search(),
    WishlistPage(),
    CartPage(),
    ProfileBar(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        shadowElevation: 5,
        kBottomRadius: 28.0,


        // notchShader: const SweepGradient(
        //   startAngle: 0,
        //   endAngle: pi / 2,
        //   colors: [Colors.red, Colors.green, Colors.orange],
        //   tileMode: TileMode.mirror,
        // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        notchColor: Colors.black87,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_outlined,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.search_sharp,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.search,

              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),

          ///svg example
          // BottomBarItem(
          //   inActiveItem: SvgPicture.asset(
          //     'assets/search_icon.svg',
          //     color: Colors.blueGrey,
          //   ),
          //   activeItem: SvgPicture.asset(
          //     'assets/search_icon.svg',
          //     color: Colors.white,
          //   ),
          //   itemLabel: 'Page 3',
          // ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.favorite_border,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
            itemLabel: 'Page 4',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.shopping_cart,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 5',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.person_outline,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 6',
          ),

        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          // log('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}

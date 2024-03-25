import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.only(bottom: 70),
      child: Scaffold(
        appBar: AppBar(
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/11.png"),
                ),
                SizedBox(height: 10,),
                Text("Name"),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Divider(
                      thickness: 0.5,
                      height: 30,
                    ),
                  ),
                ),
                itemProfile("Discover", Icons.home_max_outlined, () {
                  // Navigate to the DiscoverPage when the item is clicked
                  Get.to(DiscoverPage());
                }),
                const SizedBox(height: 10),
                itemProfile("Events", Icons.event, () {
                  Get.to(DiscoverPage());
                }),
                const SizedBox(height: 10),
                itemProfile("Order", Icons.local_shipping_outlined, () {
                  // Navigate to the DiscoverPage when the item is clicked
                  Get.to(DiscoverPage());
                }),
                const SizedBox(height: 10),
                itemProfile("Inbox", Icons.chat_bubble_outline, () {
                  // Navigate to the DiscoverPage when the item is clicked
                  Get.to(DiscoverPage());
                }),
                const SizedBox(height: 10),
                itemProfile("Settings", Icons.settings_outlined, () {
                  // Navigate to the DiscoverPage when the item is clicked
                  Get.to(DiscoverPage());
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, IconData iconData, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 5,
            )
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          leading: Icon(iconData, size: 35),
          trailing: Icon(CupertinoIcons.forward, color: Colors.grey),
        ),
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Page'),
      ),
      body: Center(
        child: Text('This is the Discover Page'),
      ),
    );
  }
}

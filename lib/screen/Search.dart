import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homepagecontroller.dart';
import 'Inear_Home.dart';

class Search extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.only(bottom: 90),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.searchController,
                onChanged: (value) {
                  controller.filterData(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
              ),
            ),
            Expanded(
              child: Obx(
                    () => GridView.builder(
                  padding: EdgeInsets.only(top: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,

                  ),
                  itemCount: controller.filteredData.length,
                  itemBuilder: (context, index) {
                    final nikeItem = controller.filteredData[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                              () => Inearhome(
                            texts: nikeItem.text,
                            images: nikeItem.imageUrl,
                            texts1: nikeItem.text1,
                            texts2: nikeItem.price,
                            texts3: nikeItem.text3,
                            size: nikeItem.size,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 145,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(nikeItem.imageUrl[0]),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),

                          Text(
                            nikeItem.text,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.0),
                          Text('Price: ${nikeItem.price}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

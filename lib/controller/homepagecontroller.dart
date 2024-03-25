import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/nike.dart';

class HomePageController extends GetxController {

  List<nikemodel> nikedata = [
    nikemodel(
        imageUrl: [
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/02bf37da-1b9b-4f16-a7c2-fd857e6b5d84/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/02bf37da-1b9b-4f16-a7c2-fd857e6b5d84/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/aa95e05f-06af-4cbb-96c0-ab3495968ef4/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7b464d7f-bd54-418c-bbe5-793c88074542/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/56efb062-1d83-4f6b-950b-84953f44ed72/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2c79d34d-706a-4dbe-86ef-e20b3d33e5f1/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/617fb491-cabd-4ced-b777-dccc00240b1f/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/00c90bb2-2b93-4e0b-b07c-cf1a78e68a28/p-6000-shoes-X54dW2.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c863edd4-2f26-43dd-a2ea-c726ded01de1/p-6000-shoes-X54dW2.png'

        ],
        text: 'Nike P-6000',
        text1: '10800.00',
        price: '9695.00',
        text3: 'A mash-up of past Pegasus sneakers, the P-6000 takes the early-2000s running look to modern heights. Combining sporty lines with breathable mesh, its the perfect mix of head-turning style and everyday comfort.',
        size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',
        ]
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f4bc5cd7-37d2-42e2-9a5e-07232e76b9e1/air-max-90-shoes-PKcwg7.png'
      ],
      text: 'Nike Air Max 90',
      text1: '13000.00',
      price: '11895.00',
      text3: '11895.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],

    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b62ad0c4-ae84-4e35-9ec4-361c5973107f/air-jordan-legacy-312-low-shoes-6Vd4Xl.png'
      ],
      text: 'Nike Air Force 1',
      text1: '13000.00',
      price: ' 11495.00',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/117890a6-97f0-457b-9550-80baf31ea1ea/jumpman-mvp-shoes-JV1HCs.png'
      ],
      text: 'Jumpman MVP1',
      text1: '15295.00',
      price: '14520.00',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cfe79686-a844-4a29-adb2-4442bf989c3c/jumpman-mvp-shoes-JV1HCs.png'
      ],
      text: 'Jumpman MVP',
      text1: '15295.00',
      price: '14527.00',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'Nike Air Force 1 LE',
      text1: '7200.00',
      price: '6295.00',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],

    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0674efa7-e274-44d0-b7a5-84cd4dd2fc31/dunk-high-older-shoes-5g3xvG.png'
      ],
      text: 'Nike Dunk High',
      text1: '7500.00',
      price: '6995.00',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1464bd95-4121-4b07-af49-dfbddff7a460/air-max-97-shoes-EBZrb8.png'
      ],
      text: 'Nike Air Max 97',
      text1: '18000.00',
      price: '16995.00',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),
    nikemodel(
      imageUrl: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/33eb9f15-0a30-4244-bf41-77861d94a45f/air-force-1-07-pro-tech-shoes-KHLmTh.png'
      ],
      text: 'snjxk',
      text1: 'jhbdvj',
      price: 'xd njn',
      text3: '9695.00',
      size: ['US 6', 'US 7', 'US 8', 'US 9.5', 'US 10',],
    ),

  ];
  TextEditingController searchController = TextEditingController();
  RxList<nikemodel> filteredData = <nikemodel>[].obs;

  @override
  void onInit() {
    filteredData.assignAll(nikedata);
    super.onInit();
  }

  void filterData(String query) {

    filteredData.assignAll(nikedata
        .where((item) =>
        item.text.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}

  



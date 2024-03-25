import 'dart:convert';

class nikemodel {
  List<String> imageUrl;
  String text;
  String text1;
  String price;
  String text3;
  List<String> size;

  nikemodel({
    required this.imageUrl,
    required this.text,
    required this.text1,
    required this.price,
    required this.text3,
    required this.size,
  });

  // Method to convert the instance to a Map (serialization)
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'text': text,
      'text1': text1,
      'text2': price,
      'text3': text3,
      'size': size,
    };
  }

  // Factory method to create an instance from a Map (deserialization)
  factory nikemodel.fromJson(Map<String, dynamic> json) {
    return nikemodel(
      imageUrl: List<String>.from(json['imageUrl']),
      text: json['text'],
      text1: json['text1'],
      price: json['text2'],
      text3: json['text3'],
      size: List<String>.from(json['size']),
    );
  }
}





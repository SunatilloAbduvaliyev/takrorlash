// "_uuid": "6e613c47-c432-471d-8934-a10d3f09c9b9",
// "author": "Author Jhon",
// "description": "A genre of speculative fiction that typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, and extraterrestrial life.",
// "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoqyts0X6kBbjxvi5wZopUSyYpqgxLLSP3Rg1kT4Jw4-fjJ_x2gtHCBqYwNKhTuWxsvPw&usqp=CAU",
// "is_check": 0,
// "name": "Exile of Snake",
// "price": 7400,
// "rate": 3.2

class BookModel {
  final String uuid;
  final String author;
  final String description;
  final String imageUrl;
  final int isCheck;
  final String name;
  final int price;
  final double rate;

  BookModel({
    required this.name,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.isCheck,
    required this.price,
    required this.rate,
    required this.uuid,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      uuid: json['_uuid'] as String? ?? "",
      author: json['author'] as String? ?? "",
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url']   as String? ?? '',
      isCheck: json['is_check'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      rate: json['rate'] as double? ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'image_url': imageUrl,
      'is_check': isCheck,
      'name': name,
      'price': price,
      'rate': rate,
    };
  }


  Map<String, dynamic> toForUpdateJson() {
    return {
      '_uuid': uuid,
      'author': author,
      'description': description,
      'image_url': imageUrl,
      'is_check': isCheck,
      'name': name,
      'price': price,
      'rate': rate,
    };
  }
}

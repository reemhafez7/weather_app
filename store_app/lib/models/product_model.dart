
class ProductModel{
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJason(jasonData){

    return ProductModel(
      category: jasonData['category'],
      id: jasonData['id'],
      title: jasonData['title'],
      price: jasonData['price'],
      description: jasonData['description'],
      image: jasonData['image'],
      rating:RatingModel.fromJson(jasonData['rating']));
  }

}
class RatingModel{
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});


  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
        rate: jsonData['rate'],
        count: jsonData['count']);
  }
}
//الهيدرز بتحدد شوية معلومات عن ال request الي انا بعملو

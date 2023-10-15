/// Id : 1
/// User_id : "652b60173c0fd4270000fba5"
/// Product_id : "652b5a733c0fd4270000fb5f"
/// Price : 1.5
/// Color : "red"
/// Size : 1
/// Num_of_pieces : 1
/// Image : "https://i.pinimg.com/564x/96/1d/f2/961df29d38bda27dfe0a902c753244c8.jpg"
/// Date : "10/15/2023 07:18:33 -am"
/// IsSubmitted : 1

class CartModel {
  CartModel({
      this.id, 
      this.userId, 
      this.productId, 
      this.price, 
      this.color, 
      this.size, 
      this.numOfPieces, 
      this.image, 
      this.date, 
      this.isSubmitted,});

  CartModel.fromJson(dynamic json) {
    id = json['Id'];
    userId = json['User_id'];
    productId = json['Product_id'];
    price = json['Price'];
    color = json['Color'];
    size = json['Size'];
    numOfPieces = json['Num_of_pieces'];
    image = json['Image'];
    date = json['Date'];
    isSubmitted = json['IsSubmitted'];
  }
  int? id;
  String? userId;
  String? productId;
  double? price;
  String? color;
  int? size;
  int? numOfPieces;
  String? image;
  String? date;
  int? isSubmitted;
CartModel copyWith({  int? id,
  String? userId,
  String? productId,
  double? price,
  String? color,
  int? size,
  int? numOfPieces,
  String? image,
  String? date,
  int? isSubmitted,
}) => CartModel(  id: id ?? this.id,
  userId: userId ?? this.userId,
  productId: productId ?? this.productId,
  price: price ?? this.price,
  color: color ?? this.color,
  size: size ?? this.size,
  numOfPieces: numOfPieces ?? this.numOfPieces,
  image: image ?? this.image,
  date: date ?? this.date,
  isSubmitted: isSubmitted ?? this.isSubmitted,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['User_id'] = userId;
    map['Product_id'] = productId;
    map['Price'] = price;
    map['Color'] = color;
    map['Size'] = size;
    map['Num_of_pieces'] = numOfPieces;
    map['Image'] = image;
    map['Date'] = date;
    map['IsSubmitted'] = isSubmitted;
    return map;
  }

}
/// _id : "65236f3ebd6e396200012d6d"
/// Cate_id : [{"_id":"65236b88bd6e396200012d19","Name":"Sneakers","_created":"2023-10-09T02:55:04.112Z","_changed":"2023-10-12T03:05:45.809Z","Idx":6,"Audience":"Women","Image":"https://i.pinimg.com/736x/13/3d/93/133d93c076b30997d28f1d462cf47da5.jpg"}]
/// Audi_id : [{"_id":"65236affbd6e396200012d05","Name":"Men","_created":"2023-10-09T02:52:47.410Z","_changed":"2023-10-10T02:09:24.590Z","Image":"https://i.pinimg.com/564x/14/82/0f/14820f9de34e6860c634e59c556e1d73.jpg","Idx":1}]
/// Details : "Comfortable men's sneakers"
/// Date : "2023-10-09T03:10:15.000Z"
/// Price : 20
/// Idx : 16
/// Image : "https://i.pinimg.com/564x/48/69/00/486900fd48f60c3cdc949953cee2dcfb.jpg"

class ProductShoeModel {
  ProductShoeModel({
      this.id, 
      this.cateId, 
      this.audiId, 
      this.details, 
      this.date, 
      this.price, 
      this.idx, 
      this.image,});

  ProductShoeModel.fromJson(dynamic json) {
    id = json['_id'];
    if (json['Cate_id'] != null) {
      cateId = [];
      json['Cate_id'].forEach((v) {
        cateId?.add(CateId.fromJson(v));
      });
    }
    if (json['Audi_id'] != null) {
      audiId = [];
      json['Audi_id'].forEach((v) {
        audiId?.add(AudiId.fromJson(v));
      });
    }
    details = json['Details'];
    date = json['Date'];
    price = json['Price'];
    idx = json['Idx'];
    image = json['Image'];
  }
  String? id;
  List<CateId>? cateId;
  List<AudiId>? audiId;
  String? details;
  String? date;
  int? price;
  int? idx;
  String? image;
ProductShoeModel copyWith({  String? id,
  List<CateId>? cateId,
  List<AudiId>? audiId,
  String? details,
  String? date,
  int? price,
  int? idx,
  String? image,
}) => ProductShoeModel(  id: id ?? this.id,
  cateId: cateId ?? this.cateId,
  audiId: audiId ?? this.audiId,
  details: details ?? this.details,
  date: date ?? this.date,
  price: price ?? this.price,
  idx: idx ?? this.idx,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (cateId != null) {
      map['Cate_id'] = cateId?.map((v) => v.toJson()).toList();
    }
    if (audiId != null) {
      map['Audi_id'] = audiId?.map((v) => v.toJson()).toList();
    }
    map['Details'] = details;
    map['Date'] = date;
    map['Price'] = price;
    map['Idx'] = idx;
    map['Image'] = image;
    return map;
  }

}

/// _id : "65236affbd6e396200012d05"
/// Name : "Men"
/// _created : "2023-10-09T02:52:47.410Z"
/// _changed : "2023-10-10T02:09:24.590Z"
/// Image : "https://i.pinimg.com/564x/14/82/0f/14820f9de34e6860c634e59c556e1d73.jpg"
/// Idx : 1

class AudiId {
  AudiId({
      this.id, 
      this.name, 
      this.created, 
      this.changed, 
      this.image, 
      this.idx,});
  
  dynamic operator [](String key) {
    switch (key) {
      case '_id':
        return id;
      case 'Name':
        return name;
      case '_created':
        return created;
      case '_changed':
        return changed;
      case 'Idx':
        return idx;
      default:
        throw Exception('Invalid key: $key');
    }
  }

  AudiId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['Name'];
    created = json['_created'];
    changed = json['_changed'];
    image = json['Image'];
    idx = json['Idx'];
  }
  String? id;
  String? name;
  String? created;
  String? changed;
  String? image;
  int? idx;
AudiId copyWith({  String? id,
  String? name,
  String? created,
  String? changed,
  String? image,
  int? idx,
}) => AudiId(  id: id ?? this.id,
  name: name ?? this.name,
  created: created ?? this.created,
  changed: changed ?? this.changed,
  image: image ?? this.image,
  idx: idx ?? this.idx,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['Name'] = name;
    map['_created'] = created;
    map['_changed'] = changed;
    map['Image'] = image;
    map['Idx'] = idx;
    return map;
  }

}

/// _id : "65236b88bd6e396200012d19"
/// Name : "Sneakers"
/// _created : "2023-10-09T02:55:04.112Z"
/// _changed : "2023-10-12T03:05:45.809Z"
/// Idx : 6
/// Audience : "Women"
/// Image : "https://i.pinimg.com/736x/13/3d/93/133d93c076b30997d28f1d462cf47da5.jpg"

class CateId {
  CateId({
      this.id, 
      this.name, 
      this.created, 
      this.changed, 
      this.idx, 
      this.audience, 
      this.image,});
  
  dynamic operator [](String key) {
    switch (key) {
      case '_id':
        return id;
      case 'Name':
        return name;
      case '_created':
        return created;
      case '_changed':
        return changed;
      case 'Idx':
        return idx;
      case 'Audience':
        return audience;
      case 'Image':
        return image;
      default:
        throw Exception('Invalid key: $key');
    }
  }

  CateId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['Name'];
    created = json['_created'];
    changed = json['_changed'];
    idx = json['Idx'];
    audience = json['Audience'];
    image = json['Image'];
  }
  String? id;
  String? name;
  String? created;
  String? changed;
  int? idx;
  String? audience;
  String? image;
CateId copyWith({  String? id,
  String? name,
  String? created,
  String? changed,
  int? idx,
  String? audience,
  String? image,
}) => CateId(  id: id ?? this.id,
  name: name ?? this.name,
  created: created ?? this.created,
  changed: changed ?? this.changed,
  idx: idx ?? this.idx,
  audience: audience ?? this.audience,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['Name'] = name;
    map['_created'] = created;
    map['_changed'] = changed;
    map['Idx'] = idx;
    map['Audience'] = audience;
    map['Image'] = image;
    return map;
  }

}
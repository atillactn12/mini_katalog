class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final Map<String, String> specifications;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.specifications,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      specifications: Map<String, String>.from(json['specifications']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'specifications': specifications,
    };
  }
}


List<Product> cartItems = [];

final List<Map<String, dynamic>> rawJsonData = [
  {
    'id': '1',
    'name': 'Beyaz Orkide',
    'description': 'Zarif ve uzun ömürlü beyaz Phalaenopsis orkide. Evinizin havasını değiştirecek şık bir dokunuş.',
    'price': 450.0,
    'imageUrl': 'assets/beyaz-orkide.jpg',
    'specifications': {'Boyut': '60-70 cm', 'Işık': 'Yarı Gölge', 'Sulama': 'Haftada 1'},
  },
  {
    'id': '2',
    'name': 'Mini Sukulent Seti',
    'description': 'Bakımı çok kolay, 3\'lü özel tasarım saksısında sukulent aranjmanı. Ofis masaları için ideal.',
    'price': 180.0,
    'imageUrl': 'assets/bonsai.jpeg', 
    'specifications': {'Boyut': '15 cm', 'Işık': 'Bol Güneş', 'Sulama': '15 Günde 1'},
  },
  {
    'id': '3',
    'name': 'Kırmızı Gül Buketi',
    'description': 'Özel günler için hazırlanmış, 11 adet birinci sınıf ithal kırmızı gül buketi.',
    'price': 750.0,
    'imageUrl': 'assets/gul-buketi.jpg',
    'specifications': {'Adet': '11 Gül', 'Renk': 'Kırmızı', 'Vazo': 'Yok'},
  },
  {
    'id': '4',
    'name': 'Papatya Aranjmanı',
    'description': 'Baharın enerjisini taşıyan taze papatyalar. Doğal hasır sepet içerisinde teslim edilir.',
    'price': 320.0,
    'imageUrl': 'assets/papatya.jpg',
    'specifications': {'Boyut': '40 cm', 'Koku': 'Hafif', 'Tür': 'Kır'},
  },
  {
    'id': '5',
    'name': 'Bonsai Ağacı',
    'description': 'Uzak doğu felsefesini evinize getiren, özenle budanmış Ficus Ginseng Bonsai.',
    'price': 890.0,
    'imageUrl': 'assets/bonsai.jpeg',
    'specifications': {'Boyut': '35 cm', 'Işık': 'Aydınlık', 'Bakım': 'Orta'},
  },
];

final List<Product> dummyProducts = rawJsonData.map((json) => Product.fromJson(json)).toList();
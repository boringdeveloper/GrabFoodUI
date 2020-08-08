class ProductCategs {
  final int id;
  final String title, description;
  final List<Product> products;

  ProductCategs({
    this.id,
    this.title,
    this.description,
    this.products,
  });
}

class Product {
  final int id;
  final String name, description, imageUrl;
  final double price;
  final bool isAvailable;

  Product({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.isAvailable,
  });
}

List<ProductCategs> restoProducts = <ProductCategs>[
  ProductCategs(
    id: 1,
    title: 'Bowls',
    description: '',
    products: <Product>[
      Product(
        id: 1,
        name: 'Thai Chicken Rice',
        description:
            'Ground Chicken, Red Chili, Sitaw, Coconut Cream, Brown Rice or Quinoa',
        imageUrl:
            'https://i.pinimg.com/564x/44/7b/51/447b51450fe4943ab964d2294e1af7a0.jpg',
        price: 189.0,
        isAvailable: true,
      ),
      Product(
        id: 2,
        name: 'Hummus Bowl',
        description:
            'Creamy hummus, Garbanzo salsa, mushrooms, corn, veggie kofta balls, wheat pizza',
        imageUrl:
            'https://i.pinimg.com/564x/8c/3e/b4/8c3eb4dbf96400916bdb63ed683a404f.jpg',
        price: 249.0,
        isAvailable: true,
      ),
      Product(
        id: 3,
        name: 'Kimchi Bowl',
        description:
            'Kimchi, Tomatoes, Pickled Cucumber, Cauliflower, Fritters, Fried Egg, Alfalfa, Soybean Glaze, Garlic Brown Rice or Quinoa',
        imageUrl: '',
        price: 229.0,
        isAvailable: false,
      ),
    ],
  ),
  ProductCategs(
    id: 2,
    title: 'Milk and Fruit Teas',
    description: '',
    products: <Product>[
      Product(
        id: 1,
        name: 'Strawberry Fruit Tea',
        description: '',
        imageUrl: '',
        price: 99.0,
        isAvailable: true,
      ),
      Product(
        id: 2,
        name: 'Mango Fruit Tea',
        description: '',
        imageUrl: '',
        price: 99.0,
        isAvailable: true,
      ),
      Product(
        id: 3,
        name: 'Taro Milk Tea',
        description: '',
        imageUrl: '',
        price: 119.0,
        isAvailable: true,
      ),
    ],
  )
];

class Product {

    final String name;
    final String category;
    final double price;
    final double? oldPrice;
    final String imageUrl;
    final bool isFavorite;
    final String description;

    const Product({
        required this.name,
        required this.category,
        required this.price,
        this.oldPrice,
        required this.imageUrl,
        this.isFavorite = false,
        required this.description,
    });
}

final List<Product> products = [
    const Product(name: "Shoes", category: "Footwear", price: 49.99, oldPrice: 99.99, imageUrl: "assets/images/shoe.jpg", description: "This is a description of the product 1"),
    const Product(name: "Laptop", category: "Electronics", price: 159.99, oldPrice: 1199.99, imageUrl: "assets/images/laptop.jpg", description: "This is a description of the product 2"),
    const Product(name: "Jordan Shoes", category: "Footwear", price: 49.99, oldPrice: 99.99, imageUrl: "assets/images/shoe2.jpg", description: "This is a description of the product 3"),
    const Product(name: "Puma", category: "Footwear", price: 49.99, oldPrice: 99.99, imageUrl: "assets/images/shoes2.jpg", description: "This is a description of the product 4"),
];
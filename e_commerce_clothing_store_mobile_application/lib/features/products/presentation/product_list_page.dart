import 'package:e_commerce_clothing_store_mobile_application/features/products/presentation/product_details_page.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product_api_service.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<Product>> _productsFuture;
  final Set<int> _favouriteIndexes = {};

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 87),
                  const Text(
                    'Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Products
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: FutureBuilder<List<Product>>(
                  future: _productsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    final products = snapshot.data!;
                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 32,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.87, // Adjusted for 155x178
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final isFavourite = _favouriteIndexes.contains(index);

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailsPage(product: product),
                              ),
                            );
                          },
                          child: ProductCard(
                            name: product.title,
                            price: "\$${product.price}",
                            imageUrl: product.image,
                            isFavourite: isFavourite,
                            onFavouriteToggle: () {
                              setState(() {
                                if (isFavourite) {
                                  _favouriteIndexes.remove(index);
                                } else {
                                  _favouriteIndexes.add(index);
                                }
                              });
                            },
                          ),
                        );
                      },
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

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavourite;
  final VoidCallback onFavouriteToggle;

  const ProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isFavourite,
    required this.onFavouriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      width: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  height: 134,
                  width: 155,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: onFavouriteToggle,
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite
                        ? Colors.white
                        : Colors.white, // Outline in white or fill with white
                    size: 24.0, // Adjust the size as needed
                  ),
                ),
              ),
            ],
          ),
          // Product Name
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 6, 8, 2),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Price and Add button
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(color: Color(0xFF6055D8)),
                ),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF6055D8),
                  child: Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

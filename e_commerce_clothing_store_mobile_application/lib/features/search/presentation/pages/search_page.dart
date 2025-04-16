import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController =
      TextEditingController(text: 'Shoes');
  int _selectedNavIndex = 1; // Search tab selected

  // Mock data for the UI
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Watch',
      'price': 40,
      'image': 'assets/watch.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Nike Shoes',
      'price': 430,
      'image': 'assets/nike_shoes.jpg',
      'isFavorite': false,
    },
    {
      'name': 'LG TV',
      'price': 330,
      'image': 'assets/lg_tv.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Airpods',
      'price': 333,
      'image': 'assets/airpods.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Jacket',
      'price': 50,
      'image': 'assets/jacket.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Hoodie',
      'price': 400,
      'image': 'assets/hoodie.jpg',
      'isFavorite': false,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {},
                    ),
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Results header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Results for "',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'Shoes',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: '"',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${_products.length} Results Found',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ],
              ),
            ),

            // Product grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return _buildProductCard(product, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with favorite button
          Expanded(
            child: Stack(
              children: [
                // Product image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: _getProductImage(product['name']),
                  ),
                ),

                // Favorite button
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _products[index]['isFavorite'] =
                            !_products[index]['isFavorite'];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        product['isFavorite']
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product['isFavorite'] ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product['price']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                ),

                // Add to cart button
                GestureDetector(
                  onTap: () {
                    // Add to cart functionality
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF6C63FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Helper method to get appropriate product images based on product name
  Widget _getProductImage(String productName) {
    // In a real app, you would use actual image assets
    // For this example, we're using placeholder colors based on product name
    Color backgroundColor;

    switch (productName.toLowerCase()) {
      case 'watch':
        backgroundColor = Colors.red;
        break;
      case 'nike shoes':
        backgroundColor = Colors.grey;
        break;
      case 'lg tv':
        backgroundColor = Colors.pink.shade100;
        break;
      case 'airpods':
        backgroundColor = Colors.brown.shade200;
        break;
      case 'jacket':
        backgroundColor = Colors.grey.shade700;
        break;
      case 'hoodie':
        backgroundColor = Colors.blue;
        break;
      default:
        backgroundColor = Colors.grey;
    }

    return Container(
      color: backgroundColor,
      child: Center(
        child: Icon(
          _getIconForProduct(productName),
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  // Helper method to get appropriate icons based on product name
  IconData _getIconForProduct(String productName) {
    switch (productName.toLowerCase()) {
      case 'watch':
        return Icons.watch;
      case 'nike shoes':
        return Icons.shopping_bag;
      case 'lg tv':
        return Icons.tv;
      case 'airpods':
        return Icons.headphones;
      case 'jacket':
        return Icons.sports_hockey;
      case 'hoodie':
        return Icons.dry_cleaning;
      default:
        return Icons.shopping_bag;
    }
  }
}

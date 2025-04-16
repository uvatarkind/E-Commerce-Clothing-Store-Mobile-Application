import 'package:e_commerce_clothing_store_mobile_application/features/products/presentation/product_list_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/profile/presentation/pages/profile_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_clothing_store_mobile_application/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/products/model/product.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/products/services/product_api_service.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/products/presentation/pages/product_detail_page.dart';
import 'package:e_commerce_clothing_store_mobile_application/config/app_router.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/cart/providers/cart_provider.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/cart/presentation/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _featuredProducts;
  late Future<List<Product>> _popularProducts;

  @override
  void initState() {
    super.initState();
    _featuredProducts =
        ProductApiService.fetchProductsByCategory("men's clothing");
    _popularProducts =
        ProductApiService.fetchProductsByCategory("women's clothing");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              _buildUserGreeting(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 24),
              _buildDiscountBanner(),
              const SizedBox(height: 24),
              _buildSectionHeader(
                  title: 'Featured', category: "men's clothing"),
              const SizedBox(height: 16),
              _buildFeaturedProducts(),
              const SizedBox(height: 24),
              _buildSectionHeader(
                  title: 'Most Popular', category: "women's clothing"),
              const SizedBox(height: 16),
              _buildMostPopularProducts(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('lib/assets/profile_picture.png'),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Jade William',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: SvgPicture.asset('lib/assets/icons/bell.svg', width: 24),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF3366FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Winter Discount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '20% Off\nFor Children',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Image.asset('lib/assets/child_cloth.png', width: 100),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      {required String title, required String category}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListPage(),
                ),
              );
            },
            child: const Text(
              'See All',
              style: TextStyle(
                color: Color(0xFF3366FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProducts() {
    return SizedBox(
      height: 200,
      child: FutureBuilder<List<Product>>(
        future: _featuredProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ProductCard(
                  name: product.title,
                  price: '\$${product.price.toStringAsFixed(2)}',
                  imagePath: product.image,
                  productId: product.id,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMostPopularProducts() {
    return SizedBox(
      height: 200,
      child: FutureBuilder<List<Product>>(
        future: _popularProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ProductCard(
                  name: product.title,
                  price: '\$${product.price.toStringAsFixed(2)}',
                  imagePath: product.image,
                  productId: product.id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final int productId;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: productId),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFF3366FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    // Add functionality for the heart icon here
                  },
                  padding: const EdgeInsets.all(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

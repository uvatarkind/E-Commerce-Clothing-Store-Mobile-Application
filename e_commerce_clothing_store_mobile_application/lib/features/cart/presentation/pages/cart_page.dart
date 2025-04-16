import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_clothing_store_mobile_application/features/orders/presentation/pages/check_out_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  PreferredSizeWidget _buildCustomAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '9:41',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('lib/assets/icons/bars.svg', width: 20),
              const SizedBox(width: 8),
              SvgPicture.asset('lib/assets/icons/wifi.svg', width: 20),
              const SizedBox(width: 8),
              SvgPicture.asset('lib/assets/icons/battery_full.svg', width: 20),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const Text(
            'Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Add functionality for more options here
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildCartItem(
                    'Watch', 'Rolex', '\$40', '2', 'lib/assets/watch.png'),
                const Divider(),
                _buildCartItem(
                    'Airpod', 'Apple', '\$333', '2', 'lib/assets/airpods.png'),
                const Divider(),
                _buildCartItem(
                    'Hoodie', 'Puma', '\$50', '2', 'lib/assets/hoodie.png'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                _buildOrderSummaryRow('Order Summary', '', isTotal: true),
                _buildOrderSummaryRow('Items', '3'),
                _buildOrderSummaryRow('Subtotal', '\$423'),
                _buildOrderSummaryRow('Discount', '\$4'),
                _buildOrderSummaryRow('Delivery Charges', '\$2'),
                const Divider(),
                _buildOrderSummaryRow('Total', '\$423', isTotal: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to checkout page using GoRouter
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    minimumSize: const Size(double.infinity, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('Check Out', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(String name, String brand, String price,
      String quantity, String imagePath) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(brand, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 8),
              Text(price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.blue),
              onPressed: () {},
            ),
            Text(quantity, style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                // Add delete functionality here
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderSummaryRow(String label, String value,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: isTotal ? 18 : 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              )),
          Text(value,
              style: TextStyle(
                fontSize: isTotal ? 18 : 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? Colors.blue : Colors.black,
              )),
        ],
      ),
    );
  }
}

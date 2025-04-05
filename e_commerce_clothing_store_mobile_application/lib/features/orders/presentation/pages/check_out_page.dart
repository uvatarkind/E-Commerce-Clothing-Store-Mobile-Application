// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedPayment = 'Credit Card'; //default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out', style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F7F7),
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.location_on, color: Color(0xFF6055D8)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '325 15th Eighth Avenue, NewYork',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Saepe eaque fugiat ea voluptatum veniam.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Time Section
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F7F7),
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.access_time, color: Color(0xFF6055D8)),
                ),
                const SizedBox(width: 12),
                const Text(
                  '6:00 pm, Wednesday 20',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 64),

            // Order Summary Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Items', style: TextStyle(color: Colors.grey)),
                      Text('3'),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Subtotal', style: TextStyle(color: Colors.grey)),
                      Text('\$423'),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Discount', style: TextStyle(color: Colors.grey)),
                      Text('\$4'),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Delivery Charges',
                          style: TextStyle(color: Colors.grey)),
                      Text('\$2'),
                    ],
                  ),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Total',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      Text('\$423',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Choose payment method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),

            GestureDetector(
              onTap: () => setState(() => _selectedPayment = 'PayPal'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/paypal.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 12),
                      Text('PayPal',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  if (_selectedPayment == 'PayPal')
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => setState(() => _selectedPayment = 'Credit Card'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/credit.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 12),
                      Text('Credit Card',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  if (_selectedPayment == 'Credit Card')
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => setState(() => _selectedPayment = 'Cash'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/cash.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 12),
                      Text('Cash',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  if (_selectedPayment == 'Cash')
                    Icon(Icons.check, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Add new payment method
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Add new payment method',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Icon(Icons.add, color: Colors.grey),
                ],
              ),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6055D8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Check Out',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

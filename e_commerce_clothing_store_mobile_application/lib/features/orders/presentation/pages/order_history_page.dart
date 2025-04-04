import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrderHistory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildOrderItem({
    required String imageUrl,
    required String title,
    required String brand,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
          SizedBox(width: 12),
          //details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  brand,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Track Order button
          ElevatedButton(
            onPressed: () {
              
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ), 
              backgroundColor: Colors.deepPurple, 
              foregroundColor: Colors.white,
            ),
            child: const Text("Track Order"),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveOrdersTab() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        _buildOrderItem(
          imageUrl: 'lib/assets/watch.png',
          title: 'Watch',
          brand: 'Rolex',
          price: '\$40',
        ),
        _buildOrderItem(
          imageUrl: 'lib/assets/earpod.png',
          title: 'Airpods',
          brand: 'Apple',
          price: '\$333',
        ),
        _buildOrderItem(
          imageUrl: 'lib/assets/hoodie.png',
          title: 'Hoodie',
          brand: 'Puma',
          price: '\$50',
        ),
      ],
    );
  }

  Widget _buildCompletedOrdersTab() {
    
    return Center(
      child: Text(
        'No Completed Orders',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCancelledOrdersTab() {
    return const Center(
      child: Text(
        'No Cancelled Orders',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepPurple,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancel'),
              ],
            ),
          ),
          //Tab bar
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildActiveOrdersTab(),
                _buildCompletedOrdersTab(),
                _buildCancelledOrdersTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

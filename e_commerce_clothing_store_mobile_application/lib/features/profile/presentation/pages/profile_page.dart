import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Status Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '9:41',
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  children: const [
                    Text(
                      '●●●●',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '📶',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Profile Info
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20%28203%29-B1iIudp3q99I5o02Q2gnqxymSU2gJO.png'),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Mark Adam',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'sunny_keepin4@hotmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          
          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(Icons.person_outline, 'Profile'),
                _buildMenuItem(Icons.settings_outlined, 'Setting'),
                _buildMenuItem(Icons.mail_outline, 'Contact'),
                _buildMenuItem(Icons.share_outlined, 'Share App'),
                _buildMenuItem(Icons.help_outline, 'Help'),
                
                const SizedBox(height: 40),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home_outlined, false),
                _buildNavItem(Icons.search, false),
                _buildNavItem(Icons.lock_outline, false),
                _buildNavItem(Icons.person_outline, true),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Icon(
        icon,
        size: 24,
        color: Colors.black87,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
  
  Widget _buildNavItem(IconData icon, bool isActive) {
    return IconButton(
      icon: Icon(
        icon,
        color: isActive ? Colors.indigo[600] : Colors.grey[600],
      ),
      onPressed: () {},
    );
  }
}
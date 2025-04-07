import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.arrow_back),
                const Spacer(),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          
          // Account Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%20%28203%29-B1iIudp3q99I5o02Q2gnqxymSU2gJO.png'),
                    ),
                    title: const Text(
                      'Mark Adam',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'sunny_keepin4@hotmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Settings Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildSettingItem(Icons.notifications_none, 'Notification'),
                  _buildLanguageItem(),
                  _buildSettingItem(Icons.shield_outlined, 'Privacy'),
                  _buildSettingItem(Icons.help_outline, 'Help Center'),
                  _buildSettingItem(Icons.info_outline, 'About us'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSettingItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: Colors.black87,
        ),
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
  
  Widget _buildLanguageItem() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.language,
          size: 18,
          color: Colors.black87,
        ),
      ),
      title: const Text(
        'Language',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'English',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
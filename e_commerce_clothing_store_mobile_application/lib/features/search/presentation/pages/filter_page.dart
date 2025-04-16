import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Selected filters
  String selectedGender = 'All';
  List<String> selectedBrands = ['Puma', 'Nike', 'Supreme'];
  RangeValues priceRange = const RangeValues(16, 543);
  List<String> selectedColors = ['Black', 'Yellow', 'Green'];

  // Filter options
  final List<String> genderOptions = ['All', 'Men', 'Women'];
  final List<String> brandOptions = [
    'Adidas',
    'Puma',
    'CR7',
    'Nike',
    'Yeezy',
    'Supreme'
  ];
  final List<String> colorOptions = [
    'White',
    'Black',
    'Grey',
    'Yellow',
    'Red',
    'Green'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Status bar and header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 44), // Balance the layout
                ],
              ),
            ),

            // Main content - scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gender section
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFilterChips(
                        options: genderOptions,
                        selectedOptions: [selectedGender],
                        onSelected: (option, isSelected) {
                          setState(() {
                            selectedGender = option;
                          });
                        },
                      ),
                      const SizedBox(height: 24),

                      // Brand section
                      const Text(
                        'Brand',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFilterChips(
                        options: brandOptions,
                        selectedOptions: selectedBrands,
                        onSelected: (option, isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedBrands.add(option);
                            } else {
                              selectedBrands.remove(option);
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 24),

                      // Price Range section
                      const Text(
                        'Price Range',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${priceRange.start.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${priceRange.end.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0xFF6C63FF),
                          inactiveTrackColor: Colors.grey[200],
                          thumbColor: Colors.white,
                          overlayColor: const Color(0x296C63FF),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 20.0),
                        ),
                        child: RangeSlider(
                          values: priceRange,
                          min: 0,
                          max: 1000,
                          onChanged: (RangeValues values) {
                            setState(() {
                              priceRange = values;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Color section
                      const Text(
                        'Color',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFilterChips(
                        options: colorOptions,
                        selectedOptions: selectedColors,
                        onSelected: (option, isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedColors.add(option);
                            } else {
                              selectedColors.remove(option);
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 24),

                      // Another option button
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: const Text(
                            'Another option',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            // Apply Filter button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Return filter results to previous screen
                  Navigator.pop(context, {
                    'gender': selectedGender,
                    'brands': selectedBrands,
                    'priceRange': priceRange,
                    'colors': selectedColors,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Apply Filter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips({
    required List<String> options,
    required List<String> selectedOptions,
    required Function(String, bool) onSelected,
  }) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: options.map((option) {
        final isSelected = selectedOptions.contains(option);
        return InkWell(
          onTap: () => onSelected(option, !isSelected),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF6C63FF) : Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';

class ProductCardList extends StatelessWidget {
  const ProductCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60,),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 12),
                child: ProductCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final TextEditingController _qtyController = TextEditingController(text: '1');

  void _changeQuantity(int delta) {
    int current = int.tryParse(_qtyController.text) ?? 1;
    int newVal = current + delta;
    if (newVal < 1) return;
    _qtyController.text = newVal.toString();
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Image Section
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  image: const DecorationImage(
                    image: AssetImage('assets/product_images/background2.png'), // replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // Name and favorite
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        'Product Name',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.favorite_border, size: 18),
                  ],
                ),
                const SizedBox(height: 4),
                // Description
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Simple 1 line desc',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                // Quantity section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.blueGrey,),
                      onPressed: () => _changeQuantity(-1),
                      iconSize: 24,
                    ),

                    SizedBox(
                      width: 40,
                      height: 30,
                      child: Material(
                        child: TextField(
                          controller: _qtyController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            final val = int.tryParse(value);
                            if (val == null || val < 1) {
                              // Optionally: reset or show warning
                            }
                          },
                        ),
                      ),
                    ),                    IconButton(
                      icon: const Icon(Icons.add_circle_outlined, color: Colors.blueGrey,),
                      onPressed: () => _changeQuantity(1),
                      iconSize: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String image;
  final String label;
  int quantity;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.label,
    this.quantity = 1,
  });
}


class CartController extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    final existingIndex = _cartItems.indexWhere((p) => p.name == product.name);
    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity = product.quantity;
    } else {
      _cartItems.add(Product(
        name: product.name,
        description: product.description,
        image: product.image,
        label: product.label,
        quantity: product.quantity,
      ));
    }
    notifyListeners();
  }
}


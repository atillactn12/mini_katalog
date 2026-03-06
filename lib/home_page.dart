import 'package:flutter/material.dart';
import 'product.dart';
import 'detail_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String aramaMetni = '';

  @override
  Widget build(BuildContext context) {
    final filtrelenmisUrunler = dummyProducts.where((urun) {
      return urun.name.toLowerCase().contains(aramaMetni.toLowerCase()) ||
             urun.description.toLowerCase().contains(aramaMetni.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destegül Çiçekçilik',
              style: TextStyle(color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'www.kibriscicekci.com',
              style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              ).then((_) => setState(() {}));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Sevdiklerinize doğadan bir armağan seçin.', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 20),
            
            TextField(
              onChanged: (deger) {
                setState(() {
                  aramaMetni = deger;
                });
              },
              decoration: InputDecoration(
                hintText: 'Çiçek veya bitki ara...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/banner.jpg',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  color: Colors.green[100],
                  child: const Center(child: Text('BANNER BULUNAMADI')),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: filtrelenmisUrunler.isEmpty 
              ? const Center(child: Text('Aradığınız çiçek bulunamadı.', style: TextStyle(color: Colors.grey)))
              : GridView.builder(
                  physics: const BouncingScrollPhysics(), 
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: filtrelenmisUrunler.length,
                  itemBuilder: (context, index) {
                    final product = filtrelenmisUrunler[index];
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus(); 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(product: product)),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.green.withOpacity(0.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                child: Image.asset(
                                  product.imageUrl, 
                                  width: double.infinity, 
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    color: Colors.green[50],
                                    child: const Center(child: Icon(Icons.local_florist, size: 40, color: Colors.green)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 4),
                                  Text('₺${product.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF2E7D32), fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
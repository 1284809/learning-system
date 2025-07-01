import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/productcontroller.dart';

class Products extends StatelessWidget {
  Products({super.key});
  @override
  final c = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Obx(() {
        if (c.isloading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: c.products.length,
          itemBuilder: (context, index) {
            final product = c.products[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Category: ${product.category}",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(
                            "Price: \$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rating: ${product.rating.rate} (${product.rating.count} reviews)",
                            style: TextStyle(color: Colors.orange[800]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

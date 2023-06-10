import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nanohealth/Models/product.dart';

class CustomListTile extends StatelessWidget {
  final Product product;
  const CustomListTile({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      product.image!,
                      scale: 5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product.price} AED",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RatingBarIndicator(
                        rating: product.rating!.rate!,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 224, 114, 1),
                        ),
                        itemCount: 5,
                        itemSize: 22.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "${product.title}",
              style: const TextStyle(
                color: Color.fromRGBO(68, 75, 81, 1),
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Text(
            "${product.description}",
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: const TextStyle(
              color: Color.fromRGBO(8, 41, 59, 1),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(
            thickness: 1.5,
            color: Color.fromRGBO(216, 216, 216, 1),
          )
        ],
      ),
    );
  }
}

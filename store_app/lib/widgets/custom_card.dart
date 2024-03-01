import 'package:flutter/material.dart'
;
import 'package:store_app/models/product_model.dart';
class CustomCard extends StatelessWidget {
  CustomCard({
    super.key, required this.product
  });

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, '/update_product_page', arguments:product );
      //حطيت ال arguments عشان امرر للبيج الي حروح الو البيانات الاصلية لل product الي بدي اعدل عليها
    },
    child :Stack(
      clipBehavior: Clip.none,
      children: [
        Container(

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 20,
                offset: Offset(1,1),
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.substring(0,6),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      r'$''${ product.price.toString()}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                          onPressed:(){},
                          icon: Icon(Icons.favorite, color: Colors.red,)
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 32,
            bottom: 85,
            child: Image.network(product.image,
              height: 100,
            width: 100,)
        ),
      ],
    ),
    );
  }
}
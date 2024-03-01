import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          IconButton(
            onPressed: (){},
              icon: const Icon(FontAwesomeIcons.cartPlus,color:Colors.black)
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('New Trend', style: TextStyle(color: Colors.black, fontSize: 21),),

      ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context,snapshot)
            //السنابشوت هيا الي بكون فيها الداتا
            {
              if(snapshot.hasData) {
                List<ProductModel> product =snapshot.data!;
                return GridView.builder(
                  itemCount: product.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                      childAspectRatio: 1.4,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(product: product[index],);
                    }
                );
              }else{return Center(child: CircularProgressIndicator());}
            }
          )
        )
    );
  }
}

// اي ودجت مربعة مسلا فيها شادو مش كونتينر هيا card

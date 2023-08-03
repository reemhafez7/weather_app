
import 'package:flutter/material.dart';
import 'package:gskap/providers/products_provider.dart';
import 'package:gskap/screens/product_details.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Main Page'),),
      body: Consumer<ProductsProvider>(
          builder:(context, provider, x){
            return Column(
              children: [
                provider.categories==null?
                   SizedBox():
                    SizedBox(
                      height: 50,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                          GestureDetector(
                          onTap: (){
                             provider.selectCategory('All');
                             },
                             child: Container(
                             alignment: Alignment.center,
                             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                             margin: EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                             decoration: BoxDecoration(
                             color: provider.SelectedCategory=='All'
                             ? Colors.orange
                                 :  Colors.blue,
                             borderRadius: BorderRadius.circular(10),

                             ),
                             child: Text('All',
                             style: TextStyle(color: Colors.white),
                             ),
                             ),
                             ),
                             ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: provider.categories!.length,
                                  itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      provider.selectCategory(provider.categories![index]);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                      margin: EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                                      decoration: BoxDecoration(
                                        color: provider.categories![index]==provider.SelectedCategory
                                            ? Colors.orange
                                            :  Colors.blue,
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                    child: Text(provider.categories![index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    ),
                                  );
                              }

                              ),

                          ],
                        ),
                      ),
                    ),
                Expanded(
                    child:provider.products==null
                ? const Center(child: CircularProgressIndicator(),)
                : ListView.builder(
                      itemCount: provider.products?.length??0,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            provider.getOneProduct(provider.products![index].id!);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)
                            {return ProductDetails();}
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 70, width: 70,
                                  child: Image.network(provider.products![index].image!,
                                  fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 10,),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(provider.products![index].title!),
                                      Text(provider.products![index].description!,maxLines: 1,),
                                      Text(provider.products![index].price!.toString(),maxLines: 1,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )



                )
              ],
            );
          }
      ),
    );
  }
}
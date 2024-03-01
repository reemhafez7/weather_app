import 'package:api_app/get/images_get_controller.dart';
import 'package:api_app/models/api_response.dart';
import 'package:api_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/upload_image_screen'),
            icon: const Icon(Icons.camera),
          ),
        ],
      ),
      body: GetX<ImagesGetController>(
        init: ImagesGetController(),
        global: true,
        builder: (controller) {
          if(controller.loading.isTrue){
            return Center(child: CircularProgressIndicator(),);
          }else if (controller.images.isNotEmpty){
            return GridView.builder(
                padding: EdgeInsets.all(15),
                itemCount: controller.images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder:(context, index){
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                        children: [
                          Image.network(
                            controller.images[index].imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                    ),
                       Align(
                         alignment: AlignmentDirectional.bottomCenter,
                         child: Container(
                           padding: EdgeInsetsDirectional.only(start: 10),
                           color: Colors.black45,
                           height: 40,
                           alignment: AlignmentDirectional.centerStart,
                           width: double.infinity,
                           child: Row(
                             children: [
                               Expanded(
                                 child: Text(controller.images[index].image,
                                 maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                 ),
                               ),
                               IconButton(
                                   onPressed: ()=> _deleteImage(context,index),
                                   icon:Icon(Icons.delete),
                                 color: Colors.red.shade800,
                               )
                             ],
                           ),
                         ),
                       )
                    ]
                  )
                  );
                }

            );
          }else {
            return Center(
              child: Text(
                  'No Images',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black45,
                ),
              ),
            );
          }
        },
      )
    );
  }

  void _deleteImage(BuildContext context ,int index) async{
    ApiResponse response = await ImagesGetController.to.delete(index);
    context.showSnackBar(message: response.message, error: response.success);
  }
}
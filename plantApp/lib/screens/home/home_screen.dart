import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/details/details_screen.dart';
import 'package:plantapp/screens/home/components.dart';
import 'package:plantapp/screens/home/featureplantcard.dart';
import 'package:plantapp/screens/home/titlewithmorebtn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // title: Text("Plant App"),
        elevation: 0,
        leading: IconButton(icon: SvgPicture.asset("assets/icons/menu.svg"),
       onPressed: (){},),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWithSearchBox(size: size),
            TitleWithMoreBtn( title: "Recomended"),
          ///////////////////////
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                RecomendPlantCard(
                  image:"assets/images/image_1.png",
                  title: "Samantha",
                  country:"Russia" ,
                  price: 440,
                  press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(),));
                  },
                ),
                RecomendPlantCard(
                  image:"assets/images/image_2.png",
                  title: "ANGELICA",
                  country:"AMERICA" ,
                  price: 540,
                  press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(),));},
                ),
                RecomendPlantCard(
                  image:"assets/images/image_3.png",
                  title: "Samantha",
                  country:"Russia" ,
                  price: 440,
                  press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(),));},
                ),

              ],
            ),
          ),
            TitleWithMoreBtn(
              title :"Featured Plants",
            ),
            ////////////////////
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  FeaturePlantCard(
                    image: "assets/images/bottom_img_1.png",
                    press: (){},
                  ),
                  FeaturePlantCard(
                    image: "assets/images/bottom_img_2.png",
                    press: (){},
                  ),

                  FeaturePlantCard(
                    image: "assets/images/bottom_img_3.jpg",
                    press: (){},
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
        ],
        ),
      ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: kDefaultPadding*2,
            right: kDefaultPadding*2,
            bottom: 17,
          ),
         // color: Colors.white,
        height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              offset: Offset(0,-10),
             // blurRadius: 40,
              color: Colors.white,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             IconButton(
               onPressed: (){},
               icon: SvgPicture.asset("assets/icons/flower.svg"),
             ),
              IconButton(

                onPressed: (){},
                icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset("assets/icons/user-icon.svg"),
              )
            ],
          ),
    ),
    );
  }
}











class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 30+ kDefaultPadding,
            ),
            height: size.height * 0.2 -27,
            decoration:const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)
            )
            ),
            child: Row(
              children: [
                Text('Hi Uishopy!',
                style: GoogleFonts.tajawal(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                ),
                Spacer(),
                Image.asset("assets/images/logo.png")

              ],
            ),
          ),
          Positioned(
            bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                     offset: Offset(0,10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                  ),
                  ],
                ),
                child:Row(
                  children:[
                    Expanded(
                      child:TextField(
                        onChanged:(value) {},
                      decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                        ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,

                  ),
                ),
              ),
                    SvgPicture.asset("assets/icons/search.svg"),
           ],
          ),
        ),
      ),
    ],
    )
      );
  }
}

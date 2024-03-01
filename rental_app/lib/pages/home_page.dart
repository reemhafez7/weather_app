import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import '../widgets/custom_all_maids.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex =0;
  List<Widget> body =[
    Icon(Icons.home),
    Icon(Icons.notes),
    Icon(Icons.chat),
    Icon(Icons.notifications),
    Icon(Icons.settings),
  ];
  final _controller =PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  IconButton(
            onPressed: (){}, icon: Icon(
          //Icons.search,
          FontAwesomeIcons.search,
          color: Colors.black,
          size: 22,
        )
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(FontAwesomeIcons.solidHeart,color: Colors.black,size: 24,))
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 358,
                height: 153,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              child: Image.asset('images/homepic.png'),
              ),
              const SizedBox(height: 10,),
              SmoothPageIndicator(
                 controller:_controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 5,
                  spacing: 5,
                  activeDotColor: kPrimaryColor,
                  dotColor: Color(0xff9A9A9A),
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Image.asset('images/user.png'),
                  SizedBox(width: 3,),
                  //const Icon(FontAwesomeIcons.user,color: kPrimaryColor,size: 18,),
                  Text('All Maids', style: GoogleFonts.roboto(
                    fontSize: 18,
                      fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
              const SizedBox(height: 20,),

              CustomAllMaids(
                textbtn: 'Available',
              backgroundColor:Color(0xff008C38).withOpacity(0.24),
                textColor:  Color(0xff04911B),
              ),
              const SizedBox(height: 10,),
              CustomAllMaids(
                  textbtn: 'Unavailable',
                backgroundColor:Color(0xff73010B).withOpacity(0.24),
                textColor:  Color(0xff73010B),
              ),
              const SizedBox(height: 10,),
              CustomAllMaids(
                textbtn: 'In Progress',
                backgroundColor:Color(0xffC68300).withOpacity(0.24),
                textColor:  Color(0xffC68300),
              ),
              const SizedBox(height: 10,),
              CustomAllMaids(
                textbtn: 'Available',
                backgroundColor:Color(0xff008C38).withOpacity(0.24),
                textColor:  Color(0xff04911B),
              ),
              const SizedBox(height: 10,),

            ],

          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
             // backgroundColor: Colors.white,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: const Color(0xffC3C2C6),
              unselectedLabelStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontSize: 13,

              ),
             showUnselectedLabels: true,
             currentIndex: _currentIndex,
              onTap: (int newIndex){
               setState(() {
                 _currentIndex= newIndex;
               });
              },
              items:  [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(FontAwesomeIcons.home)
                ),
                BottomNavigationBarItem(
                  label: 'Orders',
                  icon: Icon(FontAwesomeIcons.fileLines),
                ),
                BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(FontAwesomeIcons.solidCommentDots),
                ),
                BottomNavigationBarItem(
                  label:'Notification',
                  icon: Icon(Icons.notifications),

                ),
                BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(Icons.settings),
                ),
            ],
            ),



    );
  }
}


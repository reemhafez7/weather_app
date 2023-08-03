import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast/screens/podcastWidget.dart';
import 'package:podcast/screens/podcast_screens.dart';

import 'categoryWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Podcast',
                      style:GoogleFonts.poppins(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,

                      ) ,
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: 40,
                          width:40,
                          decoration:  BoxDecoration(
                             gradient:const LinearGradient(
                                 colors :[
                                   Color(0xffE85C19),
                                   Color(0xffFFBB82),
                                 ],
                               begin: Alignment.bottomRight,
                               end : Alignment.topLeft,
                             ),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 3, color: Color(0xff707070))
                          ),

                        ),
                        Image.asset('assets/girl.png'),
                      ],
                    ),
                  ],
                ),
               const SizedBox(height: 35,),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff676B76),
                        Color(0xffA0A4AE),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff676B76).withOpacity(0.4),
                        blurRadius: 40,
                        offset: const Offset(0,20),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff656872),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Podcast...',
                              style: GoogleFonts.poppins(
                                color: Color(0xffdddddd),
                              ),
                            ),
                            Container(
                              width: 37,
                              height: 37,
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                     const Divider(
                        height: 40,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xff656872),
                        thickness: 0.8,
                      ),
                      Text("Your Category",style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                      ),),
                      const SizedBox(height: 40,),
                      Row(
                        children: const [
                          CategoryWidget(color: Colors.deepOrangeAccent, text: 'UI',),
                          SizedBox(width: 10,),
                          CategoryWidget(color: Color(0xff656872), text: 'UX',),
                          SizedBox(width: 10,),
                          CategoryWidget(color: Color(0xff656872), text: 'Logo',),
                        ],
                      ),
                      const  SizedBox(height: 10,),
                      Row(
                        children: [
                          const CategoryWidget(color: Color(0xff656872), text: 'Art',),
                          const SizedBox(width: 10,),
                          const CategoryWidget(color:Color(0xff656872), text: 'Idea',),
                          const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff656872),
                            ),
                            child: Center(
                              child: Text('+',
                                style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 27,
                                ),
                              ),
                            ),
                          ),
                        )
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Text("UI Podcasts",
                 style: GoogleFonts.poppins(
                   fontSize: 27,
                     fontWeight: FontWeight.w400
                 ),
                ),
                const SizedBox(height: 20,),
               const PodcastWidget(
                  img: 'assets/img1.png',
                  text1: 'UI Narrative' ,
                  text2: 'Podtail' ,
                  icon:Icon(Icons.pause, color: Colors.white,),
                  color: Colors.deepOrangeAccent,
                ),
                const SizedBox(height: 20,),
               const PodcastWidget(
                  img: 'assets/img2.png',
                  text1: 'UX Podcast' ,
                  text2: 'Announcer Name' ,
                  icon:Icon(Icons.play_arrow_rounded, color: Colors.white,),
                  color: Color(0xff676B76),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PodcastScreen(),),);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors:[
                          Color(0xff676B76),
                          Color(0xffA0A4AE),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      boxShadow:[
                        BoxShadow(
                          offset: Offset(0,20),
                          color: Color(0xff676B76).withOpacity(0.4),
                          blurRadius: 40,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/img1.png'),
                            const SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Empathizing With users',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('04:16 / 49:20',
                                  style: GoogleFonts.poppins(
                                    color:Colors.white70,
                                    fontSize: 15,

                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.pause, color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Home',
                            style: GoogleFonts.poppins(
                              color: Colors.deepOrangeAccent,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5,),
                          CircleAvatar(
                            backgroundColor: Colors.deepOrangeAccent,
                            radius: 4,
                          ),
                        ],
                      ),
                      Image.asset('assets/hearico.png'),
                      Image.asset('assets/gapico.png'),
                    ],
                  ),
                ),


              ],

            ),
          ),
        ),
      ),
    );
  }
}


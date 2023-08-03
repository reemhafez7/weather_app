import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast/screens/home_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {

  double _value = 40.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(25, 40, 25, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff676B76),
                                    Color(0xffA0A4AE),
                                  ],
                                  begin: Alignment.bottomRight,
                                  end : Alignment.topLeft,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:const  Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff676B76),
                                  Color(0xffA0A4AE),
                                ],
                                begin: Alignment.bottomRight,
                                end : Alignment.topLeft,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset('assets/setting.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,20),
                              color: Colors.deepOrangeAccent.withOpacity(0.6),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/bigimg.png'),
                      ),
                      Text(
                          'Empathizing With users',
                           style: GoogleFonts.poppins(
                             fontSize: 20,
                             fontWeight: FontWeight.w400,
                           ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'UI Narrative : UI/UX Design Podcast',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade300,
                              ),
                              child:const Icon(Icons.favorite,
                              color: Colors.red,
                              ),

                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade300,
                              ),
                              child: const Icon(Icons.download_rounded,
                                color: Color(0xff838DA7),
                              ),

                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade300,
                              ),
                              child: Icon(Icons.share_outlined,
                                color: Color(0xff838DA7),
                              ),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('08:88',
                            style: TextStyle(color: Color(0xff838DA7)),
                          ),
                          Expanded(
                              child: SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: _value,
                                inactiveColor: Color(0xfffD4D9E8),
                                activeColor: Colors.deepOrangeAccent,
                                thumbIcon: const Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 7.5,
                                  ),
                                ),
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              ),
                          ),
                          Text('49:16',
                            style: TextStyle(color: Color(0xff838DA7)),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/back.png'),
                          Container(
                            width: 70,
                              height: 70,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0,10),
                                  color: Colors.deepOrangeAccent.withOpacity(0.5),
                                  blurRadius: 20,
                                ),
                              ],
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          Image.asset('assets/next.png'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  decoration: const BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [
                        Color(0xff676B76),
                        Color(0xffA0A4AE),
                      ],
                      begin: Alignment.bottomRight,
                      end : Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.vertical(top:Radius.circular(35),),
                  ),
                  child:Column(
                    children: [
                      Container(
                        height: 8,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/playlist.png'),
                          SizedBox(width: 15,),
                          Text(
                            'Next Up',
                            style: GoogleFonts.poppins(color: Colors.white,
                            fontSize: 20,
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ) ,
                )
              ],
            ),
          ),
        ),
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:leadkart/ApiServices/adsApi.dart';
import 'package:leadkart/ApiServices/statesApi.dart';
import 'package:leadkart/component/HelpButtonWhite.dart';
import 'package:leadkart/component/addRequirmentTile.dart';
 
import 'package:leadkart/controllers/shredprefrence.dart';
 
import 'package:leadkart/component/helpButton.dart';

import 'package:leadkart/helper/dimention.dart';
import 'package:leadkart/helper/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, String>> items = [

    {'image': 'assets/home_images/img_1.png', 'text': 'AI Meta content'},
    {'image': 'assets/img.png', 'text': 'AI created Ads'},
    {'image': 'assets/home_images/img_2.png', 'text': 'Leads'},
    {'image': 'assets/home_images/img_5.png', 'text': 'Ad Reports'},
  ];

  List<IconData> iconList = [
    Icons.groups,
    Icons.home,
    Icons.call_outlined,
    Icons.facebook,
    Icons.account_circle,
    Icons.mail_outline,
    // Add more icons as needed
  ];


  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        leading: SizedBox(),
        leadingWidth: 0,

        title: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: SC.from_width(40),
              height: SC.from_height(30),
              decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/home_images/img.png',
              ),
            ),
            InkWell(
              onTap: () {
                MyHelper.mybottomPanel(context: context,
                    builder: (context,d) {
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          controller: d,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('SK e solution $index'),
                              onTap: () {
                                StatesApi().getAllCitiesByStateAndUserId('664493e6bda98d4d03a5faec', '66446389926d794e368c8f6c');
                              },
                            );
                          },
                        ),
                      );
                    });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    " SK e solution  ",
                    style: TextStyle(color: Colors.white, fontSize: SC.from_height(18)),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
Spacer(),
            // SizedBox(width: SC.from_width(50)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HelpButton(),
            ),
          ],
        ),
        // actions: [
        //
        //
        //   // Container(
        //   //   child: Row(
        //   //     mainAxisAlignment: MainAxisAlignment.center,
        //   //     children: [
        //   //       Icon(Icons.search,size:  SC.from_height(17),color: Colors.white,),
        //   //       SizedBox(width: SC.from_height(4),),
        //   //       Center(child: Text('Search',style: TextStyle(fontSize: SC.from_height(16),color: Colors.white),),),
        //   //     ],
        //   //   ),
        //   //   width: SC.from_height(85),
        //   //   height: SC.from_height(30),
        //   //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(15)),border: Border.all(
        //   //       color: Colors.white,width: 1.5
        //   //   )),
        //   // ),
        //   SizedBox(width: SC.from_height(20)),
        // ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:SC.from_height(18) ),
        children: [
          // SelectPlanTile(),


          SizedBox(height: SC.from_height(15),),

          Text('Introducing AI-powered ads with Leadkart',style: TextStyle(fontSize: SC.fromWidth(22),  fontWeight: FontWeight.w500,),),

          SizedBox(height: SC.from_height(8),),


          // GRIDVIEW BUILDER //
          GridView.builder(
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: SC.from_width(7),
              crossAxisSpacing: SC.from_width(7),
              mainAxisExtent: SC.from_width(50),
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return  Container(
                margin: EdgeInsets.symmetric(horizontal: SC.from_width(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AspectRatio(
                      aspectRatio: 0.9,
                      child: Container(
                        padding: EdgeInsets.all(SC.from_width(8)),
                        // decoration: BoxDecoration(border: Border.all()),
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: SC.from_width(3)), // Add some spacing between image and text
                    Expanded(
                      child: Text(
                        item['text']!,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 7),
                          fontWeight: FontWeight.w500,
                          fontSize: SC.from_width(16),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1, // Adjust maxLines if you want to limit the number of lines for text
                      ),
                    ),
                  ],
                ),
              );

            },
          ),

          SizedBox(height: SC.from_height(15),),

          // Center(
          //   child: CarouselSlider(
          //     options: CarouselOptions(
          //       aspectRatio: 16 / 9,
          //       viewportFraction: 1,
          //       initialPage: 0,
          //       enableInfiniteScroll: true,
          //       reverse: false,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: true,
          //       scrollDirection: Axis.horizontal,
          //     ),
          //     items: [
          //       GestureDetector(
          //         onTap: () {
          //           // Handle onTap event
          //           // Navigator.push(context, MaterialPageRoute(builder: (context) => TopFeaturedPropety()));
          //           // Get.to(DetailGalleryScreen());
          //         },
          //         child: Container(
          //           clipBehavior: Clip.hardEdge,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8), // Replace SC.from_height(8) with a fixed value
          //           ),
          //           margin: EdgeInsets.only(
          //            // Replace ScreenDim.from_width(10) with a fixed value
          //             top: 5, // Replace ScreenDim.from_width(5) with a fixed value
          //             bottom: 10, // Replace ScreenDim.from_width(10) with a fixed value
          //           ),
          //           child: Image.asset(
          //             'assets/home_images/img_3.png',
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Container(
            clipBehavior: Clip.hardEdge,
            child:
            Image.asset('assets/home_images/img_3.png',fit: BoxFit.cover,),
            // width: SC.fromWidth(50),
            // height: SC.from_height(200),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(SC.from_height(8)),),
          ),

          SizedBox(height: SC.from_height(15),),

          Container(child: Image.asset('assets/home_images/4.png',fit: BoxFit.cover,)),

          SizedBox(height: SC.from_height(19),),

          Text('Choose your Ad requirement',style: TextStyle(fontSize:  SC.from_height(18),fontWeight: FontWeight.w500),),

          SizedBox(height: SC.from_height(15),),

          // CHOOSE ADD REQUIREMENT //
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){

                },
                child: Container(margin: EdgeInsets.only(top: SC.from_height(15),left: SC.from_height(2),right: SC.from_height(2)),
                  width: double.infinity,
                  // height: SC.from_height(85),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(SC.from_height(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10), // Shadow color with opacity
                        spreadRadius: 0.5, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(1, 2), // Offset in x and y directions
                      ),
                    ],
                  ),
                  child: AddREquirmentTile(icon:Icon(iconList[index],color: Colors.black54,),),
                ),
              );
            },
            itemCount: 4,
          ),

          SizedBox(height: SC.from_height(20),),

          Container(
              // height: SC.from_height(134),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/home_images/img_4.png',fit: BoxFit.cover,)),


          SizedBox(height: SC.from_height(20),),

          SizedBox(height: SC.from_height(10),),

        ],
      ),
    );
  }
}




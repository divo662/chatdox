import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/search_chat.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return  DefaultTabController(
      length: 2,
      child: Scaffold(

          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chatdox Calls",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.black
                  ),
                ),
                Icon(Icons.more_horiz_sharp,
                  color: Colors.black,
                  size: 24,)
              ],
            ),

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     TextButton(onPressed: (){},
                         child: Text("Edit",
                         style: TextStyle(
                           fontSize: 19,
                           fontWeight: FontWeight.bold,
                           color: Colors.blue
                         ),)),
                      Container(
                        height: 45,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200
                        ),
                        child: Center(
                          child: TabBar(
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.blue,
                            labelColor: Colors.blue,
                            dividerColor: Colors.blue,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(2),
                            tabs: const [
                              Tab(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      fontSize: 17.7, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Missed",
                                  style: TextStyle(
                                      fontSize: 17.7, fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                            controller: tabController,
                            labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                          ),
                        ),
                      ),
                       IconButton(
                         onPressed: (){},
                         icon: Icon(Icons.add_call,
                         color: Colors.blue,
                         size: 24,),
                        ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          elevation: 15,
                          builder: (BuildContext context){
                            return StatefulBuilder
                              (builder: (BuildContext context,
                                StateSetter setState){
                              return const SearchChat();
                            });
                          });
                    },
                    child: Container(
                      height: 50,
                      width: 390,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.search,
                              color: Colors.grey.shade700,),
                            const SizedBox(width: 8,),
                            Text("Search",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade700
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        // Your first tab view content here
                        Container(
                          color: Colors.white,
                          child: const Center(
                            child: Text("Messages Tab View"),
                          ),
                        ),
                        // Your second tab view content here
                        Container(
                          color: Colors.white,
                          child: const Center(
                            child: Text("Groups Tab View"),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          )
      ),
    );
  }
}

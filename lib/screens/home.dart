import 'package:chatdox/widget/search_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/status_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin {
  bool showBackPage = false;
  ScrollController scrollController = ScrollController();
  int activeIndex = 0;
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return  DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
            },
            backgroundColor: Colors.blue,
            child: const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
          ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chatdox Messages",
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
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.person,
                      color: Colors.blue,
                      size: 30,),
                    ),
                    Container(
                      height: 55,
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
                                "Message",
                                style: TextStyle(
                                    fontSize: 17.7, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Groups",
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
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.notifications_active,
                        color: Colors.blue,
                        size: 30,),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Center(
                  child: GestureDetector(
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
                ),
                const SizedBox(height: 20,),
                Text("Status",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusViewer(
                        name: "My Status",
                        icon: CupertinoIcons.add,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                      StatusViewer(
                        name: "David",
                        icon: CupertinoIcons.person,
                      ),
                    ],
                  ),
                ),
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

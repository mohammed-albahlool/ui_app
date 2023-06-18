import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstTeamScreen extends StatefulWidget {
  const FirstTeamScreen({Key? key}) : super(key: key);

  @override
  State<FirstTeamScreen> createState() => _FirstTeamScreenState();
}

class _FirstTeamScreenState extends State<FirstTeamScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController ;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Screen (1)'),
        bottom: TabBar(
          controller: _tabController,
          //****************************************
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade400,
          //****************************************
          onTap: (int index){
            print("TabIndex: $index");
          },
          //****************************************
          labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            letterSpacing: 0,
            fontWeight: FontWeight.w300,
          ),
          //****************************************
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.tab,
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(0),
          // indicator: BoxDecoration(
          //   color: Colors.deepOrange,
          //   borderRadius: BorderRadius.circular(10)
          // ),
          //****************************************
          // labelPadding: EdgeInsets.all(0),
          // padding: EdgeInsets.all(0),
          //****************************************
          isScrollable: false,
          physics: BouncingScrollPhysics(),
          //****************************************
          tabs: [
            Tab(text: "First"),
            Tab(text: "Second"),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.note),
                title: Text("Note #$index"),
                subtitle: Text("Note Info"),
              );
            },),
          GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.pink.shade100 : Colors.blue.shade100,
              );
            },
          ),
        ],
      ),

    );
  }
}

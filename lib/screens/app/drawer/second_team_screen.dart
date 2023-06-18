import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTeamScreen extends StatefulWidget {
  const SecondTeamScreen({Key? key}) : super(key: key);

  @override
  State<SecondTeamScreen> createState() => _SecondTeamScreenState();
}

class _SecondTeamScreenState extends State<SecondTeamScreen>
    with SingleTickerProviderStateMixin{

  late TabController _tabController;

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
        title: Text('Team Screen (2)'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 40),
            Text(
              "UserName",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                onTap: (int value){
                  setState(() => _tabController.index = value);
                },
                tabs: [
                  Tab(text: "First"),
                  Tab(text: "Second"),
                ],
            ),
            IndexedStack(
              index: _tabController.index,
                children: [
                  Visibility(
                    visible: _tabController.index == 0 ,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.note),
                          title: Text("Note #$index"),
                          subtitle: Text("Note Info"),
                        );
                      },),
                  ),
                  Visibility(
                    visible: _tabController.index == 1,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 16,
                      shrinkWrap: true,
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
                  ),

                ],

            ),

            
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_app/models/country.dart';
import 'package:ui_app/models/subjects.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _showNotifications = false;
  String? _gender;
  late RangeValues _rangeValues;
  int? _selectedCountryId;
  List<String> _expereinces = <String>[];
  late TextEditingController _experienceTextController;

  final List<Subject> _subjects = <Subject>[
      Subject("Sports"),
      Subject("Casual"),
      Subject("Jackets"),
  ];

  final List<Country> _countries = <Country>[
    const Country(1, "Palestine"),
    const Country(2, "Egypt"),
    const Country(3, "Saudi Arabia"),
    const Country(4, "Qatar"),
  ];

  @override
  void initState() {
    super.initState();
    _rangeValues = RangeValues(100, 200);
    _experienceTextController = TextEditingController();
  }

  @override
  void dispose() {
    _experienceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
     children: [
       SwitchListTile(
         activeColor: Colors.purple.shade900,
         activeTrackColor: Colors.purple.shade200,
         //***************************************************
         inactiveTrackColor: Colors.grey.shade200,
         inactiveThumbColor: Colors.grey.shade500,
         //***************************************************
         title: Text('Notifications'),
         subtitle: Text('Enable/Disable Notifications'),
         value: _showNotifications,
         contentPadding: EdgeInsets.zero,
         onChanged: (bool value) {
           setState(() => _showNotifications = value);

       },),
       SizedBox(height: 20),
       Text(
         "Gender",
         style: GoogleFonts.poppins(
           fontWeight: FontWeight.bold,
           fontSize: 18,
           color: Colors.black),
       ),
       Row(
         children: [
           Expanded(
             child: RadioListTile(
               title: Text('male'),
               value: "M",
               groupValue: _gender,
               onChanged: (String? value) {
                 setState(() => _gender = value);
               },
             ),
           ),
           Expanded(
             child: RadioListTile(
               title: Text('Female'),
               value: "F",
               groupValue: _gender,
               onChanged: (String? value) {
                 setState(() => _gender = value);
               },
             ),
           ),
         ],
       ),

       SizedBox(height: 20),
       Text(
         "Price Range",
         style: GoogleFonts.poppins(
           fontWeight: FontWeight.bold,
           fontSize: 18,
         ),
       ),
       RangeSlider(
         min: 0,
         max: 300,
         values: _rangeValues,
         divisions: 20,
         labels: RangeLabels(
           _rangeValues.start.toString(),
           _rangeValues.end.toString(),
         ),
         activeColor: Colors.pink,
         inactiveColor: Colors.pink.shade100,
         onChanged: (RangeValues value) {
           setState(() => _rangeValues = value);
         },),

       SizedBox(height: 20),
       Text(
         "Subjects",
         style: GoogleFonts.poppins(
           fontWeight: FontWeight.bold,
           fontSize: 18,
         ),
       ),
       for (Subject subject in _subjects)
       CheckboxListTile(
         title: Text(subject.name),
         value: subject.checked,
         activeColor: Colors.pink,
         checkColor: Colors.white,
         checkboxShape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(3),
         ),
         onChanged: (bool? value) {
           if(value != null){
             setState(() => subject.checked = value);
           }
         },
       ),

       SizedBox(height: 20),
       Text(
         "Country",
         style: GoogleFonts.poppins(
           fontWeight: FontWeight.bold,
           fontSize: 18,
         ),
       ),
       DropdownButton<int>(
         isExpanded: true,
         hint: Text('Select country',
           style: GoogleFonts.poppins(
               fontSize: 14,
           ),
         ),
         itemHeight: 48,
         onTap: () => print("Menu Tapped"),
         icon: const Icon(Icons.keyboard_arrow_down_outlined),
         borderRadius: BorderRadius.circular(10),
         style:  GoogleFonts.poppins(
           fontSize: 13,
           color: Colors.black,
         ),
         onChanged: (int? value){
           setState(() => _selectedCountryId = value);
         },
         value: _selectedCountryId,
         items: _countries.map(
               (Country country) => DropdownMenuItem<int>(
                 value: country.id,
                 child: Text(country.name),

               ),
         ).toList(),
       ),
       SizedBox(height: 20),
       Text(
         "Experiences",
         style: GoogleFonts.poppins(
           fontWeight: FontWeight.bold,
           fontSize: 18,
         ),
       ),
       TextField(
         controller: _experienceTextController,
         keyboardType: TextInputType.text,
         style: GoogleFonts.poppins(fontSize: 14),
         onSubmitted: (value){
           print("Save");
         },
         decoration: InputDecoration(
           hintText: "Enter experience",
           suffixIcon: IconButton(
             onPressed: (){
             _performSava();
           }, icon: const Icon(Icons.save_outlined),),
         ),
       ),

       Wrap(
         runSpacing: 10,
         spacing: 10,
         children: _expereinces.map(
                 (e) => Chip(
                   label: Text(e),
                   labelStyle: GoogleFonts.poppins(
                     color: Colors.black45,
                     fontSize: 13,
                   ),
                   backgroundColor: Colors.white,
                   elevation: 5,
                   avatar: const Icon(Icons.work_outline,
                   color: Colors.black45,
                   ),
                   deleteIcon: Icon(
                     Icons.close,
                     color: Colors.red.shade700,
                     size: 18,
                   ),
                   deleteIconColor: Colors.red.shade700,
                   onDeleted: () => deleteExperience(e),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                     side: const BorderSide(
                       color: Colors.blue,
                       width: 1,
                     ),
                   ),


                 ),).toList(),
       )

       
     ],
    );
  }

  void _performSava() {
    if(_checkData()){
      _save();
    }
  }

  bool _checkData() {
    if(_experienceTextController.text.isNotEmpty){
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Enter required data"),
      backgroundColor: Colors.red.shade700,
      duration: Duration(seconds: 3),
    ),
    );
    return false;
  }

  void _save() {
    setState(() {
       _expereinces.add(_experienceTextController.text);
    });
    _clear();
  }

  void _clear() {
    _experienceTextController.clear();
  }

  void deleteExperience(String experience){
    setState(() => _expereinces.remove(experience));

  }














}

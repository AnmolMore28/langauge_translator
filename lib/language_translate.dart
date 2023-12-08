
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguagetranlatorPage extends StatefulWidget {
  const LanguagetranlatorPage ({super.key});

  @override
  _LanguagetranslatorPageState createState() => _LanguagetranslatorPageState();
}

class _LanguagetranslatorPageState extends State<LanguagetranlatorPage> {
var languages=["Marathi","Hindi","English"];
var originLanguage="From";
var destinationlanguage="To";
var output="";
TextEditingController langaugecontroler = TextEditingController();
void translate(String src,String dest,String input) async{
  GoogleTranslator translator = new GoogleTranslator();
 var translation = await translator.translate(input,from:src,to:dest);
setState(() {
  output = translation.text.toString();
});
if (src=="--"||dest=="--"){
  setState(() {
    output="Fail to translate";
  });
}
}


String getLanguageCode(String language){
  if (languages =="English") {
    return "en";
  }  else if(languages =="Hindi"){
    return "hi";
  }else if (languages=="Marathi") {
    return"mr";
  }
  return"--";
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff10223d) ,
      appBar: AppBar(title:Text( "Language Translator"),centerTitle:true,
    backgroundColor: Color(0xff10223d),
    elevation:0,
    ),
       body: Center(
         child: SingleChildScrollView(
           child: Column(
             children:[
               SizedBox(height: 50,),
               Row(
             mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   DropdownButton(focusColor: Colors.white,
                   iconDisabledColor: Colors.white,
                   iconEnabledColor: Colors.white,
                   hint: Text(
                     originLanguage,style: TextStyle(color: Colors.white),
                   ),
                   dropdownColor: Colors.white,
                     icon: Icon(Icons.keyboard_arrow_down),
                     items: languages.map((String dropDownSringItem){
                       return DropdownMenuItem(child: Text(dropDownSringItem),
                       value:dropDownSringItem,);
                     }).toList(),
                     onChanged: (String? value) {
                       setState(() {
                         originLanguage = value!;
                       });
                     },
                   ),
                   SizedBox(width: 40,),
                 Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 40,),
               SizedBox(width: 40,),
                   DropdownButton(focusColor: Colors.white,
                     iconDisabledColor: Colors.white,
                     iconEnabledColor: Colors.white,
                     hint: Text(
                       destinationlanguage,style: TextStyle(color: Colors.white),
                     ),
                     dropdownColor: Colors.white,
                     icon: Icon(Icons.keyboard_arrow_down),
                     items: languages.map((String dropDownSringItem){
                       return DropdownMenuItem(child: Text(dropDownSringItem),
                         value:dropDownSringItem,);
                     }).toList(),
                     onChanged: (String? value) {
                       setState(() {
                         destinationlanguage = value!;
                       });
                     },
                   ),
                 ],
               ),
             SizedBox(height: 48,),
               Padding(padding:EdgeInsets.all(8),
               child:TextFormField(
                   cursorColor: Colors.white,
                 autofocus: false,
                 style:  TextStyle(color: Colors.white),
               decoration: const InputDecoration(
                 labelText: "Please enter your text... ",
                 labelStyle: TextStyle(fontSize:15,color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color:Colors.white,width:1)
                 ),
               errorStyle: TextStyle(color:Colors.red,fontSize: 15),
               ),
               controller: langaugecontroler,
                 validator: (value){
                 if (value==null||value.isEmpty) {
                   return "Please enter some text to translate";
                 }
                return null; }
               ) ,),
             Padding(
                 padding: const EdgeInsets.all(8),
               child: ElevatedButton(

                 onPressed:(){var languageController;
translate(getLanguageCode(originLanguage), getLanguageCode(destinationlanguage), languageController.text.toString as String);},

               child:const Text("Translate")),),
             const SizedBox(height:20),
               Text(
                 "\n$output",
                 style:const TextStyle(
                   color: Colors.white,
                   fontWeight:FontWeight.bold,
                   fontSize:20
                 ),
               )
             ],
           ),
         ),
       ),
    );
   
  }
}

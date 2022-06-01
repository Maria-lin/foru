import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
 void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> _locations = ['femme', 'Homme']; // Option 2 String _selectedLocation;
  TextEditingController sampledata1=new TextEditingController();
  TextEditingController sampledata2=new TextEditingController();
  TextEditingController sampledata3=new TextEditingController();
  TextEditingController sampledata4=new TextEditingController();
  TextEditingController sampledata5=new TextEditingController();
  TextEditingController sampledata6=new TextEditingController();
  TextEditingController sampledata7=new TextEditingController();
  TextEditingController sampledata8=new TextEditingController();
  TextEditingController sampledata9=new TextEditingController();





  String _selectedLocation;
  TextEditingController dateinput2 = TextEditingController();
  TextEditingController dateinput1= TextEditingController();
  String dropdownValue = 'One';

  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final form_Key = GlobalKey<FormState>();
  final bool allowDecimal = false;
  //key for form
  String username = '';
  String email = '';
  String password = '';

// the current step
  int _currentStep = 0;
// Determines whether the stepper's orientation is vertical or horizontal
  // This variable can be changed by using the switch below
  bool _isVerticalStepper = true;

  // This function will be triggered when a step is tapped
  _stepTapped(int step) {
    setState(() => _currentStep = step);
  }

  // This function will be called when the continue button is tapped
  _stepContinue() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  // This function will be called when the cancel button is tapped
  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }



  @override


  void initState() {
    dateinput1.text = "";
    dateinput2.text= ""; //set the initial value of text field
    super.initState();
  }
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('form-accident '),
        ),
        key: _scaffoldKey,
        body: Column(
            children: [
        // Controls the stepper orientation
        SwitchListTile(
        title: const Text('Vertical Stepper?'),
        subtitle: const Text('vertical/horizontal direction'),
        value: _isVerticalStepper,
        onChanged: (_) {
          setState(() {
            _isVerticalStepper = !_isVerticalStepper;
          });
        }),
    const Divider(
    thickness: 2,
    height: 30,
    ),

    Expanded(
    // the Stepper widget
    child: Stepper(
    // vertical or horizontial
    type: _isVerticalStepper
    ? StepperType.vertical
        : StepperType.horizontal,
    physics: const ScrollPhysics(),
    currentStep: _currentStep,
    onStepTapped: (step) => _stepTapped(step),
    onStepContinue: _stepContinue,
    onStepCancel: _stepCancel,
    steps: [

                Step(
                    title: Text("Task-1"),
                    content:Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Form(
                        key: _formKey, //key for form
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:height*0.04),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(color: Colors.transparent),
                                      height: 25.0,
                                      width: 25.0,
                                      child: Center(
                                        child:  _wavy(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height:height*0.04),
                              TextFormField(
                                 controller: sampledata1,
                                decoration:InputDecoration(
                                  labelText:"Enter your full name", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.deepPurpleAccent),),
                                ),// Input Decoration
                                validator:(value){
                                  if (value.length < 4) {
                                    return 'Enter at least 4 characters';}
                                  if(value.isEmpty ||!RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
                                    return"Enter correct name" ;
                                  } else {
                                    return null;

                                  }
                                },
                              ),


                              SizedBox(height:height*0.04),
                              TextFormField(
                                controller: sampledata2,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration:InputDecoration(
                                  labelText:"Enter your number ",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.deepPurpleAccent     , width: 0,),),
                                                     ),
                                // Input Decoration
                                validator:(value){
                                  if(value.isEmpty ||!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)){
                                    return"Enter your number correctly " ;
                                  } else {
                                    return null;

                                  }
                                },
                              ),

                              SizedBox(height:height*0.04),
                              TextFormField(
                                controller: sampledata3,
                                decoration:InputDecoration(
                                  labelText:"Enter your email ",



                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.deepPurpleAccent),),
                                ),// Input Decoration
                                validator:(value){

                                  if(value.isEmpty ||!RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)').hasMatch(value)){
                                    return"ton email est incorrecte ";
                                  } else {
                                    return null;

                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) => setState(() => email = value),


                              ),



                              SizedBox(height:height*0.04),
                              TextFormField(
                               controller: sampledata4,
                                decoration:InputDecoration(
                                    labelText:"Enter your password ",
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.deepPurpleAccent),),
                            
                                  suffix:  IconButton(icon: Icon(Icons.visibility), onPressed: () {}) ,
                                ),
                                // Input Decoration
                                validator:(value){

                                  if (value.length < 7) {
                                    return 'Password must be at least 7 characters long';
                                  }
                                  else {
                                    return null;

                                  }
                                },

                                onSaved: (value) => setState(() => password = value),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                              SizedBox(height:height*0.04),
                              DropdownButtonFormField( hint: Text(' votre sexe'),
                                  value: _selectedLocation,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(10.0),

                                      ),borderSide: BorderSide(color: Colors.deepPurpleAccent),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: "Name",
                                  ),
                                   // Not necessary for Option 1

                                onChanged: (newValue) { setState(() { _selectedLocation = newValue; }); },
                                items: _locations.map((location) { return DropdownMenuItem( child: new Text(location),
                                  value: location, ); }).toList(), ),

                              SizedBox(height:height*0.04),
                          TextField(
                            controller: dateinput1, //editing controller of this TextField
                            decoration: InputDecoration(

                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0),

                                    ),borderSide: BorderSide(color: Colors.deepPurpleAccent),
                                      ), prefixIcon: Icon(Icons.calendar_today),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "VOTRE DATE DE naissance",

                                 //icon of text field
                                 //label text of field
                            ),
                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );

                              if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput1.text = formattedDate; //set output date to TextField value.
                                });
                              }else{
                                print("Date is not selected");
                              }
                            },
                          ),

                              SizedBox(height:height*0.04),

                              Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children:[
                                    NeumorphicButton(
                                      margin:EdgeInsets.only(top:12),

                                      onPressed: () {
                                        // Validate returns true if the form is valid, or false otherwise.
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();

                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          final message =
                                              'Username: $username\nPassword: $password\nEmail: $email';
                                          final snackBar = SnackBar(
                                            content: Text(
                                              message,
                                              style: TextStyle(fontSize: 20),
                                            ),

                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                        }




                                      },




                                      style:NeumorphicStyle(
                                          shape:NeumorphicShape.flat,
                                          boxShape:
                                          NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),

                                          border:NeumorphicBorder()
                                      ),// NeumorphicStyle
                                    ),

                                  ]



                              ),


                              // height: 50,





                            ]

                        ),
                      ),





                    ),
                      isActive: _currentStep >= 0,
    state: _currentStep >= 0
    ? StepState.complete
        : StepState.disabled,

                    subtitle: Text("Compled"),
                    ),
                Step(
                    title: Text("Task-2"),

                  content:
                  Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Form(
                          key: formKey, //key for form
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              SizedBox(height:height*0.04),
                          Center(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  height: 25.0,
                                  width: 25.0,
                                  child: Center(
                                    child:  _wavy(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height:height*0.04),
                    TextFormField(
                      controller: sampledata5,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:InputDecoration(
                        labelText:"entrer votre matricule svp ",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.deepPurpleAccent     , width: 0,),),
                      ),
                      // Input Decoration
                      validator:(value){
                        if(value.isEmpty ){
                          return"remplissez ce champ svp " ;
                        } else {
                          return null;

                        }
                      },
                    ),
                    SizedBox(height:height*0.04),
                          TextField(

                            controller: dateinput2, //editing controller of this TextField
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0),

                                ),borderSide: BorderSide(color: Colors.deepPurpleAccent),
                              ), prefixIcon: Icon(Icons.calendar_today),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "VOTRE DATE DE l'incident ",

                              //icon of text field
                              //label text of field
                            ),
                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );

                              if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput2.text = formattedDate; //set output date to TextField value.
                                });
                              }else{
                                print("Date is not selected");
                              }
                            },
                          ),
                              ]
                          ),
                      ),
                  ),

                          isActive: _currentStep >= 0,
                           state: _currentStep >= 1
                           ? StepState.complete
                          : StepState.disabled,
                                   ),
                Step(
                    title: Text("Task-3"),
                    content: Container(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Form(
                      key: form_Key, //key for form
                      child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height:height*0.04),
                      Center(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.transparent),
                                height: 25.0,
                                width: 25.0,
                                child: Center(
                                  child:  _wavy(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:height*0.04),

                        TextField(
                           controller: sampledata6,
                            cursorColor: Colors.deepPurpleAccent,

                            decoration: InputDecoration(
                              labelText: 'décrivez  l objet que vous avez perdu ',
                              hintText: 'description',
                              //labelStyle: textStyle,
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.deepPurpleAccent),),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 2, color: Colors.purpleAccent)),
                            )

                        ),

                            SizedBox(height:height*0.04),RaisedButton(
                              onPressed: () {
                               Map<String,dynamic>data={"nom et prénom": sampledata1.text,"numéro de telephone ": sampledata2.text,"email": sampledata3.text,"mot de passe ": sampledata4.text,"sexe": dateinput1.text,"date de naissance ":sampledata5.text,"matricule": dateinput2.text,"field8": sampledata6.text
                              };
                               Firestore.instance.collection("form-accident").add(data);
    // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                              },
                              child: Text('Submit'),
                            )

  ]
                    ),
                    ),
                    ),


    isActive: _currentStep >= 0,
    state: _currentStep >= 2
    ? StepState.complete
        : StepState.disabled,
    ),


              ],

              controlsBuilder: (BuildContext context, ControlsDetails details)=>Container(),
),         )
  ]
    )
    );}
}

Widget _wavy(){
  return DefaultTextStyle(
    style: const TextStyle(
      fontSize: 25.0,
      color: Colors.black,
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText("remplissez vos informations ,",
            speed: Duration(milliseconds: 100)),
        WavyAnimatedText('personnelle',
            speed: Duration(milliseconds: 100 )),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
    ),
  );
}

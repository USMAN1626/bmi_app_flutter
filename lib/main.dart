import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '- - BMI APP - -',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade900),
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var weightcontroller = TextEditingController();
  var feetcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.grey.shade300;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' BMI Calculator   '),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width:320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    ClipOval(
                        child: Image.asset('assets/images/abc.png', width: 250,height: 250,)),
                    SizedBox(height: 50,),
                    TextField(
                      controller: weightcontroller,
                      decoration: InputDecoration(
                          label: Text(" Enter your weight in kg ", style: TextStyle(fontSize: 20)),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: feetcontroller,
                      decoration: InputDecoration(
                          label: Text(" Enter your height in feet ", style: TextStyle(fontSize: 20)),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: inchcontroller,
                      decoration: InputDecoration(
                          label: Text(" Enter your height in inches" , style: TextStyle(fontSize: 20),),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 40,),
              
                    Container(height: 50,
              
                      child: ElevatedButton(
                          onPressed: () {
                            var weight = weightcontroller.text;
                            var feet = feetcontroller.text;
                            var inches = inchcontroller.text;
              
                            if (weight != "" && feet != "" && inches != "") {
                              // BMI CALCULATION
                              var intweight = int.parse(weight);
                              var intfeet = int.parse(feet);
                              var intinches = int.parse(inches);
                              // height should be in meters bcz si unit of bmi is kg/m square
              
                              var totalinches = (intfeet * 12) + intinches;
              
                              // 1 inch = 2.54 cm
                              // 1/100 m = 1 cm
              
                              var totalcm = totalinches * 2.54;
                              var totalmeters = totalcm / 100;
              
                              var bmi = intweight / (totalmeters * totalmeters);
                              var msg;
                              if(bmi>25){
                                msg= " You are over weight ";
                                bgcolor =Colors.orange.shade300;
                              }
                              else if(bmi <18){
                                msg= " You are Under  Weight ";
                                bgcolor =Colors.red.shade300;
                              }
                              else{
                                msg= " You are Healthy  ";
                                bgcolor =Colors.green.shade300;
              
                              }
                              setState(() {
                                result = "$msg\n Your BMI is ${bmi.toStringAsFixed(3)} ";
                              });
                            } else {
                              setState(() {
                                result = ' Please fill all the required blanks ';
                              });
                            }
                          },
                          child: Text(' Calculate ', style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
              
                    SizedBox(height: 26,),
              
                    Text(
                      result,
                      style: TextStyle(fontSize: 19 , fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

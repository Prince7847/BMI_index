import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    var wtController = TextEditingController();
    var ftController = TextEditingController();
    var inchController = TextEditingController();
    var result ='';
    var bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator App'),
        ),
      body: Container(
        color: bgColor,
        child: Center(
        child: Container(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 25)),
              Text('Boby Mass Index', style:TextStyle(
                fontSize: 34, fontWeight: FontWeight.w600,

              ) ,
              ),

              SizedBox(height: 23),

              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your weight(in kgs)'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 12),

              TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in fts)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number
              ),

              SizedBox(height: 12),

              TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number
              ),

              SizedBox(height: 17),
              
              ElevatedButton(onPressed: (){

                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inchController.text.toString();


                if(wt != '' && ft != '' && inch != ''){

                  //BMI calculate
                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);


                  var tInch = (iFt*12)+iInch;
                  var tCm = tInch*2.54;
                  var tM = tCm/100;
                  var bmi = iWt/(tM+tM);

                  var msg ='';
                  if(bmi>25){
                      msg = 'You are OverWeight !';
                      bgColor = Colors.deepOrangeAccent;

                  }else if(bmi<18){

                  msg = 'You are UnderWeight !';
                  bgColor = Colors.redAccent;

                  }else{
                     msg = 'You are Healthy !';
                     bgColor = Colors.lightGreen;
                  }

                  setState(() {
                    result = '$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                  });


                }else{
                  setState(() {
                    result ='Please fill all the required details !';
                  });
                }


              }, child: Text('Calculate')),

              SizedBox(height: 20),

              Text(result, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
      ),
    );
  }
}


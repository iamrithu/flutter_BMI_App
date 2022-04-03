import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF12a644),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height = 170;
  // ignore: prefer_final_fields
  double _weight = 70;

  int _bmi = 0;
  String _condition = "Select Data";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: size.height * 0.35,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            decoration: const BoxDecoration(
              color: Color(0xFF12a644),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('BMI',
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Text('Calculator',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              SizedBox(
                width: double.infinity,
                child: Text('$_bmi',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700)),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Condition :',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 25.0),
                        children: <TextSpan>[
                      TextSpan(
                        text: _condition,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      )
                    ])),
              )
            ]),
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Column(children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'Choose Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Color(0xFF12a644),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Height : ',
                      style: const TextStyle(
                          color: Color(0xFF403f3d), fontSize: 20.0),
                      children: <TextSpan>[
                    TextSpan(
                      text: '$_height cm',
                      style: const TextStyle(
                          color: Color(0xFF403f3d),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    )
                  ])),
              SizedBox(
                height: size.height * 0.03,
              ),
              Slider(
                value: _height,
                min: 0,
                max: 250,
                onChanged: (height) {
                  setState(() {
                    _height = height;
                  });
                },
                divisions: 200,
                label: "$_height ",
                activeColor: const Color(0xFF403f3d),
                inactiveColor: Colors.grey,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Weight : ',
                      style: const TextStyle(
                          color: Color(0xFF403f3d), fontSize: 20.0),
                      children: <TextSpan>[
                    TextSpan(
                      text: '$_weight kg',
                      style: const TextStyle(
                          color: Color(0xFF403f3d),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    )
                  ])),
              SizedBox(
                height: size.height * 0.03,
              ),
              Slider(
                value: _weight,
                onChanged: (weight) {
                  setState(() {
                    _weight = weight;
                  });
                },
                min: 0,
                max: 200,
                divisions: 200,
                label: '$_weight',
                activeColor: const Color(0xFF403f3d),
                inactiveColor: Colors.grey,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                  width: size.width * 0.80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: ElevatedButton(
                      child: const Text('Calculate',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500)),
                      onPressed: () {
                        setState(() {
                          _bmi =
                              ((_weight) / ((_height / 100) * (_height / 100)))
                                  .round()
                                  .toInt();

                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _condition = "Normal";
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _condition = "Overweight";
                          } else if (_bmi > 30) {
                            _condition = "Obesity";
                          } else {
                            _condition = "Underweight";
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff12a644),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 40.0)),
                    ),
                  ))
            ]),
          )
        ]),
      ),
    );
  }
}

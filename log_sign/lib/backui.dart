
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Background Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Animated Background Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static const numBehaviours = 6;

  // Particles
  ParticleType _particleType = ParticleType.Shape;
  Image _image = Image.asset('assets/images/star_stroke.png');

  ParticleOptions particleOptions = ParticleOptions(
    //image: Image.asset('assets/images/star_stroke.png'),
    baseColor: Colors.blue,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 40,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;


  // Bubbles
  BubbleOptions _bubbleOptions = BubbleOptions();

  // General Variables
  int _behaviourIndex = 0;
  Behaviour _behaviour;

  bool _showSettings = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AnimatedBackground(
        behaviour: _behaviour = _buildBehaviour(),
        vsync: this,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _showSettings ? _buildSettings() : Container(),
          ),
        ),
      ),
    );
  }





  Widget _buildSettings() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('Next'),
                onPressed: () {
                  setState(() {
                    _behaviourIndex = (_behaviourIndex + 1) % numBehaviours;
                  });
                },
              ),
              SizedBox(width: 10.0),
              Text('Current: ${_behaviourIndex + 1} out of $numBehaviours'),
            ],
          ),
          SizedBox(height: 10.0),
          Text('Behaviour: ${_behaviour.runtimeType.toString()}'),
          SizedBox(height: 10.0),
        ]
    );
  }


  Behaviour _buildBehaviour() {
    return RandomParticleBehaviour(
      options: particleOptions,
      paint: particlePaint,
    );
  }
}

enum ParticleType {
  Shape,
  Image,
}
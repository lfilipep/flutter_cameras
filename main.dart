import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: const Color(0x00000000),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 43, 224, 194),), //app bar color -> #2be0c2
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nocktronics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VlcPlayerController _videoPlayerController1;
  late VlcPlayerController _videoPlayerController2;
  late VlcPlayerController _videoPlayerController3;
  late VlcPlayerController _videoPlayerController4;

  @override
  void initState() {
    super.initState();

    _videoPlayerController1 = VlcPlayerController.network(
      'rtsp://luis.santos@nocktronics.com:NockNock1234@192.168.31.51:554/stream1',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    _videoPlayerController2 = VlcPlayerController.network(
      'rtsp://luis.santos@nocktronics.com:NockNock1234@192.168.31.52:554/stream1',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    _videoPlayerController3 = VlcPlayerController.network(
      'rtsp://luis.santos@nocktronics.com:NockNock1234@192.168.31.53:554/stream1',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    _videoPlayerController4 = VlcPlayerController.network(
      //'rtsp://luis.santos@nocktronics.com:NockNock1234@192.168.31.28:554/stream1',
      'rtsp://luis.santos@nocktronics.com:NockNock1234@192.168.31.54:554/stream1',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController1.stopRendererScanning();
    await _videoPlayerController1.dispose();

    await _videoPlayerController2.stopRendererScanning();
    await _videoPlayerController2.dispose();

    await _videoPlayerController3.stopRendererScanning();
    await _videoPlayerController3.dispose();

    await _videoPlayerController4.stopRendererScanning();
    await _videoPlayerController4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(5),
        //   child: AppBar(
        //     // TRY THIS: Try changing the color here to a specific color (to
        //     // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        //     // change color while the other colors stay the same.
        //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //     //backgroundColor: Colors.black,
        //     // Here we take the value from the MyHomePage object that was created by
        //     // the App.build method, and use it to set our appbar title.
        //     centerTitle: true,
        //     //title: Text(widget.title),
        //   ),
        // ),

        appBar: AppBar(
            // TRY THIS: Try changing the color here to a specific color (to
            // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
            // change color while the other colors stay the same.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            toolbarHeight: 25,
         
            title: Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: <Widget>[
              //Text(widget.title),https://i.postimg.cc/SRnhww4M/Logo-Branco.png
              //Image.network("https://i.postimg.cc/SRnhww4M/Logo-Branco.png", width: 160, height:80),
              Image.asset("images/Logo-Branco.png", width: 160, height:80),
              ],
            ),
            //backgroundColor: Colors.black,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            //centerTitle: true,
            //title: Text(widget.title),
          ),
       

        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 16 / 9,
            children: [
              VlcPlayer(
                controller: _videoPlayerController1,
                aspectRatio: 16 / 9,
                placeholder: const Center(child: CircularProgressIndicator()),
              ),
              VlcPlayer(
                controller: _videoPlayerController2,
                aspectRatio: 16 / 9,
                placeholder: const Center(child: CircularProgressIndicator()),
              ),
              VlcPlayer(
                controller: _videoPlayerController3,
                aspectRatio: 16 / 9,
                placeholder: const Center(child: CircularProgressIndicator()),
              ),
              VlcPlayer(
                controller: _videoPlayerController4,
                aspectRatio: 16 / 9,
                placeholder: const Center(child: CircularProgressIndicator()),
              ),
            ]));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:'AnimeFont',
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController _pageController = PageController(initialPage:0);

  void navigate(index){
      _pageController.animateToPage(index, duration:Duration(seconds:1), curve:Easing.standard);
  }
void scroll(){

  print(_pageController.initialPage);
}



  @override
  void initState() {
    _pageController=PageController(initialPage:0)..addListener(() {scroll(); });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor:Colors.orange,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:PageView(
        controller:_pageController,
        onPageChanged:(index){navigate(index);},
        children: [
          makePage('assets/images/one.jpeg','Kakashi','1',"Kakashi Hatake is a fictional character and one of the main protagonists in the Naruto manga and anime series created by Masashi Kishimoto."),
          makePage('assets/images/two.jpeg','Pikaschu','2','Pikachu is a yellow, mouse-like creature with electrical abilities. It is a major character in the Pokémon franchise, serving as its mascot and as a major '),
          makePage('assets/images/three.jpeg','Demon','3','Demon Slayer: Kimetsu no Yaiba is a Japanese anime television series based on Koyoharu Gotouges manga series of the same name'),
          makePage('assets/images/four.jpeg','Naruto','4','Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki,'),
          makePage('assets/images/five.jpeg','Naruto','5',""),
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget makePage(image,title,pageNo,description){
      return Container(
        decoration:BoxDecoration(
          image:DecorationImage(
            fit:BoxFit.cover,
            image:AssetImage(image)
          )
        ),
        child:Container(
            decoration:BoxDecoration(
              gradient:LinearGradient(
                begin:Alignment.bottomRight,
                stops:[.3,.9,],
                colors:[
                  Colors.black.withOpacity(.9),
                  Colors.black87.withOpacity(.2)
                ]
              )
                  
            ),
          
          child:Padding(
            padding:EdgeInsets.all(20),
            child:Column(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                crossAxisAlignment:CrossAxisAlignment.baseline,
                textBaseline:TextBaseline.alphabetic,
                children: [
                  Text(pageNo,style:TextStyle(color:Colors.white,fontSize: 30,fontWeight:FontWeight.bold),),
                  Text('/5',style:TextStyle(color:Colors.white,fontSize: 15,fontWeight:FontWeight.bold),)
                ],
              ),
                Expanded(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.end,
                      crossAxisAlignment:CrossAxisAlignment.start,
                     children: [
                       Text(title.toUpperCase(),style:TextStyle(color:Colors.white,fontSize:50,fontWeight:FontWeight.bold, ),),
                       SizedBox(height:10,),
                       Row(
                         children: [
                           Container(child:Icon(Icons.star,color:Colors.yellow,size:15,),),
                           Container(child:Icon(Icons.star,color:Colors.yellow,size:15,),),
                           Container(child:Icon(Icons.star,color:Colors.yellow,size:15,),),
                           Container(child:Icon(Icons.star,color:Colors.yellow,size:15,),),
                           Container(child:Icon(Icons.star,color:Colors.grey,size:15,),),
                           Text('4.0',style:TextStyle(color:Colors.white70),),
                           Text('(2300)',style:TextStyle(color:Colors.white38,fontSize:12),)

                         ],

                       ),
                       SizedBox(height:10,),
                       Padding(padding:EdgeInsets.only(right:60),child:Text(description,style:TextStyle(color:Colors.white60,fontSize:20,fontWeight:FontWeight.w100,height:1.7),),),
                       SizedBox(height:20,),
                       Text("READ MORE",style:TextStyle(color:Colors.white12),)
                     ],
                )
                )

              ],
            ),
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Twitter'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: const <Widget>[
          TweetWidget(
            avatar: "F",
            avatarColor: Colors.red,
            userLongName: "Its a me a Mario",
            userShortName: "mario",
            timeString: "2min",
            description: "I am good",
            imageURL:
                "https://stickershop.line-scdn.net/stickershop/v1/product/4295014/LINEStorePC/main.png",
            numComments: 10,
            numLikes: 33,
            numRetweets: 2,
          ),
          TweetWidget(
            avatar: "D",
            avatarColor: Colors.amber,
            userLongName: "DogBoy",
            userShortName: "DB",
            timeString: "10min",
            description: "But I am a good boi",
            imageURL: "https://i.ytimg.com/vi/s-I_dV5oY8c/hqdefault.jpg",
            numComments: 55,
            numLikes: 12,
            numRetweets: 5,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TweetWidget extends StatefulWidget {
  const TweetWidget(
      {required this.avatar,
      required this.avatarColor,
      required this.userShortName,
      required this.userLongName,
      required this.timeString,
      required this.description,
      required this.imageURL,
      required this.numComments,
      required this.numLikes,
      required this.numRetweets})
      : super();

  final String avatar;
  final Color avatarColor;
  final String userShortName;
  final String userLongName;
  final String timeString;
  final String description;
  final String imageURL;
  final int numComments;
  final int numRetweets;
  final int numLikes;

  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  Icon repeat = const Icon(
    Icons.repeat,
    color: Colors.blue,
    size: 18,
  );
  Icon liked = const Icon(
    Icons.favorite_border,
    color: Colors.blue,
    size: 18,
  );

  bool isLiked = false;

  void clickRetweet() {
    setState(() {
      repeat = const Icon(
        Icons.repeat_one,
        color: Colors.blueGrey,
        size: 18,
      );
    });
  }

  void clickLiked() {
    if (!isLiked) {
      setState(() {
        liked = const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 18,
        );
        isLiked = !isLiked;
      });
    } else {
      setState(() {
        liked = const Icon(
          Icons.favorite_border,
          color: Colors.blue,
          size: 18,
        );
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Align(
              child: CircleAvatar(
                  backgroundColor: widget.avatarColor,
                  child: Text(widget.avatar)),
              alignment: Alignment.topCenter,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 8,
                          child: Container(
                            padding: const EdgeInsets.only(right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.userLongName),
                                Text("@${widget.userShortName}"),
                                Text(widget.timeString)
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.expand_more,
                              color: Colors.blue,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(widget.description),
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                      child: Image.network(
                        widget.imageURL,
                        fit: BoxFit.fill,
                      ),
                      height: 150),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blue,
                                size: 18,
                              ),
                              Text(widget.numComments.toString())
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              IconButton(icon: repeat, onPressed: clickRetweet),
                              Text(widget.numRetweets.toString())
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              IconButton(icon: liked, onPressed: clickLiked),
                              Text(widget.numLikes.toString())
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.bookmark_border,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
            ),
          )
        ],
      ),
      padding: const EdgeInsets.all(10),
    );
  }
}

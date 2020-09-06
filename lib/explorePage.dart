import 'package:StandWithTravel/test.dart';
import 'package:flutter/material.dart';

enum tabs {
  Activities,
  Stays,
  Flights,
}
double availableHeight;
double availableWidth;

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  tabs selectedTab = tabs.Activities;
  void switchTo(tabs pressedtab) {
    setState(() {
      selectedTab = pressedtab;
    });
  }

  // AnimationController _buttonController;
  // @override
  // void initState() {
  //   super.initState();
  //   _buttonController = new AnimationController(
  //     vsync: this,
  //     duration: new Duration(milliseconds: 1000),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    CardController controller; //Animation Controller
 
    //AppBar Widget
    AppBar customAppbar = AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      backgroundColor: Colors.white70,
      title: Text(
        "Explore all businesses",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text("Activities"),
              onPressed: () {
                switchTo(tabs.Activities);
              },
              color: selectedTab == tabs.Activities
                  ? Color.fromRGBO(56, 60, 76, 1)
                  : Colors.white,
              textColor:
                  selectedTab == tabs.Activities ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            RaisedButton(
              child: Text("Stays"),
              onPressed: () {
                switchTo(tabs.Stays);
              },
              color: selectedTab == tabs.Stays
                  ? Color.fromRGBO(56, 60, 76, 1)
                  : Colors.white,
              textColor:
                  selectedTab == tabs.Stays ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            RaisedButton(
              child: Text("Flights"),
              onPressed: () {
                switchTo(tabs.Flights);
              },
              color: selectedTab == tabs.Flights
                  ? Color.fromRGBO(56, 60, 76, 1)
                  : Colors.white,
              textColor:
                  selectedTab == tabs.Flights ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ),
    );

    //Safe Area
    availableHeight =
        MediaQuery.of(context).size.height - customAppbar.preferredSize.height;
    availableWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1),
      appBar: customAppbar, //Line 41
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: availableHeight * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SwapCard(
                orientation: AmassOrientation.LEFT,
                totalNum: exploreCard.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: availableWidth * 0.9,
                maxHeight: availableHeight * 0.9,
                minWidth: availableWidth * 0.7,
                minHeight: availableHeight * 0.7,
                cardBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: CustomCard(index),
                ),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                },
              ),
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}

//Bottom Stack including view and save buttons
class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: availableHeight * 0.1,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        overflow: Overflow.visible,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Positioned(
            top: -25,
            child: Container(
              width: availableWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: availableWidth / 3,
                    child: RaisedButton(
                      color: Color.fromRGBO(253, 210, 98, 1),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white70,
                          ),
                          Text(
                            "Save",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: availableWidth / 3,
                    child: RaisedButton(
                      child: Text(
                        "View this",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        print(availableWidth.toString());
                      },
                      color: Color.fromRGBO(253, 210, 98, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
class CustomCard extends StatelessWidget {
  int index;
  CustomCard(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            overflow: Overflow.clip,
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  '${exploreCard[index].pic}',
                  fit: BoxFit.cover,
                  height: availableHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  exploreCard[index].title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(253, 210, 98, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    exploreCard[index].desc,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.pin_drop,
                          size: 18,
                          color: Color.fromRGBO(253, 210, 98, 1),
                        ),
                      ),
                      Text(
                        exploreCard[index].hashtag,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//Dummy Data
class ExploreCard {
  String pic;
  String title;
  String desc;
  String hashtag;
  List<String> tags;

  ExploreCard(this.pic, this.title, this.desc, this.hashtag, this.tags);
}

List<ExploreCard> exploreCard = [
  ExploreCard('images/pic1.jpg', "Card 1", "This is the First Card", "#card1",
      ["tag1", "tag 2", "tag3"]),
  ExploreCard('images/pic2.jfif', "Card 2", "This is the Second Card", "#card2",
      ["tag1", "tag 2", "tag3"]),
  ExploreCard('images/pic3.jfif', "Card 3", "This is the third Card", "#card3",
      ["tag1", "tag 2", "tag3"]),
  ExploreCard('images/pic4.jfif', "Card 4", "This is the fourth Card", "#card4",
      ["tag1", "tag 2", "tag3"]),
];

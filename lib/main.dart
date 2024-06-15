// import "package:example/interactive_example.dart";
// import "package:example/screens.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:sleek_circular_slider/sleek_circular_slider.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // make flutter draw behind navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const PersistenBottomNavBarDemo());
}

class PersistenBottomNavBarDemo extends StatelessWidget {
  const PersistenBottomNavBarDemo({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Persistent Bottom Navigation Bar Demo",
        home: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed("/minimal"),
                  child: const Text("Show Minimal Example"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/interactive"),
                  child: const Text("Show Interactive Example"),
                ),
              ],
            ),
          ),
        ),
        routes: {
          "/minimal": (context) => const MinimalExample(),
          // "/interactive": (context) => const InteractiveExample(),
        },
      );
}

class MinimalExample extends StatelessWidget {
  const MinimalExample({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const MainScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const MainScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: const MainScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Settings",
          ),
        ),
        PersistentTabConfig(
          screen: const MainScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.safety_check),
            title: "Home",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 241, 241),
        title: const Text(
          "My Diary",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.arrow_back_ios),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.calendar_month),
          Text("15 may"),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: const Icon(Icons.add),
          )),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mediteranean diet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("details-")
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 28,
                                    child: VerticalDivider(
                                      thickness: 2,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Eaten",
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.heart_broken),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "1127 ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            "data",
                                            style: TextStyle(fontSize: 8),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 28,
                                    child: VerticalDivider(
                                      thickness: 2,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Burned",
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.whatshot,
                                            color: Color.fromARGB(
                                                255, 245, 148, 3),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "102 ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            "data",
                                            style: TextStyle(fontSize: 8),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: SleekCircularSlider(
                              appearance: const CircularSliderAppearance(),
                              onChange: (double value) {
                                print(value);
                              }),
                        )
                      ],
                    ),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("carbo"),
                              SizedBox(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  )),
                              Text(
                                "10g left",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("fat"),
                              SizedBox(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.amber,
                                    thickness: 2,
                                  )),
                              Text("50g left", style: TextStyle(fontSize: 10))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("protein"),
                              SizedBox(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.red,
                                    thickness: 2,
                                  )),
                              Text("120g left", style: TextStyle(fontSize: 10))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meals today",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("details-")
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 100,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 245, 99, 89),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(50))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.hearing),
                          Text(
                            "braekfast",
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "braekfast todat",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "braek",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "5344",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 100,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 123, 186, 237),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(50))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.hearing),
                          Text(
                            "braekfast",
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "braekfast todat",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "braek",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "5344",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 100,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 248, 84, 138),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(50))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.hearing),
                          Text(
                            "braekfast",
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "braekfast todat",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "braek",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            child: Icon(Icons.add),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Body measurements",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("today-")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

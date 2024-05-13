import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/heart_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracker/widgets/transaction_model.dart';
import 'package:expense_tracker/widgets/transaction.dart';
import 'package:expense_tracker/widgets/see_all_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;
  // final List<bool> _isPressedList = [];
  List<IconData> iconDataList = [
    Icons.home,
    Icons.swap_horizontal_circle,
    Icons.account_balance_wallet,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "David",
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400, width: 1.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none),
                    color: const Color.fromARGB(255, 0, 0, 0),
                    iconSize: 24,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: _buildOutlinedButton('All', () {}, 0),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildOutlinedButton('Daily', () {}, 1),
                        _buildOutlinedButton('Weekly', () {}, 2),
                        _buildOutlinedButton('Monthly', () {}, 3),
                        _buildOutlinedButton('Annually', () {}, 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 238, 242, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                          child: Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 99, 92, 92),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            '\$8,429',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 238, 242, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                          child: Text(
                            'Spent',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 99, 92, 92),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            '\$3,621',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent transactions',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                SeeAllButton(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Column(
                  children: transactions.map((transaction) {
                    return TransactionSection(transaction: transaction);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 70.0,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(141, 92, 246, 1),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HeartPage()),
            );
          },
          // ignore: sort_child_properties_last
          child: const Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white,
        height: 65.0,
        itemCount: iconDataList.length,
        tabBuilder: (index, isActive) {
          final color =
              isActive ? const Color.fromRGBO(141, 92, 246, 1) : Colors.grey;
          List<String> labels = ['Home', 'Transfer', 'Wallet', 'Profile'];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _bottomNavIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconDataList[index], color: color),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  Widget _buildOutlinedButton(String text, VoidCallback onPressed, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
          decoration: BoxDecoration(
            border: Border.all(
              // color: (_isPressedList.isNotEmpty &&
              //         index < _isPressedList.length &&
              //         _isPressedList[index])
              color: Colors.grey.shade300,
              // color: const Color.fromRGBO(141, 92, 246, 1),

              width: 1,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                // color: (_isPressedList.isNotEmpty &&
                //         index < _isPressedList.length &&
                //         _isPressedList[index])
                color: Colors.black
                // : Colors.grey.shade500,
                ),
          ),
        ),
      ),
    );
  }
}

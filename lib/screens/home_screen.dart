import 'package:carrot_record/states/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('합정동',
        style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: (){
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: (){
              context.read<UserProvider>().setUserAuth(false);
            },
            icon: Icon(CupertinoIcons.bars),
          ),
          IconButton(
            onPressed: (){
              context.read<UserProvider>().setUserAuth(false);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      )
    );
  }
}

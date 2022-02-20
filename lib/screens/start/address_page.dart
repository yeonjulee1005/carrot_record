import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey,),
              prefixIconConstraints: BoxConstraints(
                minWidth: 24,
                minHeight: 24
              ),
              hintText: '도로명으로 검색',
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.redAccent
                )
              )
            ),
            cursorColor: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: TextButton.icon(onPressed: (){

                },
                  icon: Icon(CupertinoIcons.compass, color: Colors.white, size: 20,),
                  label: Text('현재위치로 이동', style: TextStyle(fontSize:18, color: Colors.white),),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlue
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

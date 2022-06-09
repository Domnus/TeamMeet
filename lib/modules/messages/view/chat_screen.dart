import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class Chat extends StatefulWidget {
  final User user;

  Chat({Key? key, required this.user}) : super(key: key);
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: 
        TextSpan(
          children: [
            TextSpan(text: widget.user.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            TextSpan(text: '\n',),
            TextSpan(text: 'Online', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400,)),
            ],
        ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
        color: Colors.white,
        onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.80,
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Text(
                            'We could surely handle this mess much easily if you were here.', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                AssetImage('assets/images/users/hanai.jpg'),
                          ),
                        ),
                        Text(
                          '12:30pm',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Text(
                      'We could surely handle this mess much easily if you were here.', style: TextStyle(fontSize: 16)),
                ),
                Container(
                  child: Text('data', style: TextStyle(fontSize: 16)),
                ),
                Container(
                  child: Text('data', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          Container(
            child: Text('send message text area', style: TextStyle(fontSize: 16)),
          ),
        ],
          ),
      ),
    );
  }
}

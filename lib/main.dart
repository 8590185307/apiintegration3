import 'dart:convert';

import 'package:apiintegration3/Address.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'RespMain.dart';
import 'Users.dart';



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


  Future<List<Users>?> fetchusres()  async {
    final response = await http.get(Uri.parse("https://dummyjson.com/users"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      var getUsersData = json.decode(response.body.toString());
      var res=RespMain.fromJson(getUsersData);
      var listusres =res.users ;
      print("data:$listusres");
      return listusres;
    } else {
      throw Exception('Failed to load users');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child:  FutureBuilder(
          future: fetchusres(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var  plist = snapshot.data as List<Users>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: plist == null ? 0 : plist.length,
                itemBuilder: (BuildContext context, int index) {
                  Users st = plist[index];
                  return Card(
                    child: Row(
                      children: <Widget>[
                       // Image.network('${plist[index].thumbnail}',fit:BoxFit.cover,height: 100,width: 100,),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            child: Column(
                              children: <Widget>[
                                Text('id: ${st.id}'),
                                Text('firstName: ${st.firstName}'),
                                Text('lastName: ${st.lastName}'),
                                Text('maidenName: ${st.maidenName}'),
                                Text('age: ${st.age}'),
                                Text('gender: ${st.gender}'),
                                Text('email: ${st.email}'),
                                Text('phone: ${st.phone}'),
                                Text('username: ${st.username}'),
                                Text('password: ${st.password}'),
                                Text('birthDate: ${st.birthDate}'),
                                Text('image: ${st.image}'),
                                Text('bloodGroup: ${st.bloodGroup}'),
                                Text('height: ${st.height}'),
                                Text('weight: ${st.weight}'),
                                Text('eyeColor: ${st.eyeColor}'),
                                Text('hair: ${st.hair}'),
                                Text('domain: ${st.domain}'),
                                Text('ip: ${st.ip}'),
                                Text('address: ${st.address?.address}'),
                                Text('university: ${st.university}'),
                                Text('bank: ${st.bank}'),
                                Text('company: ${st.company?.address?.address}'),
                                Text('ein: ${st.ein}'),
                                Text('ssn: ${st.ssn}'),
                                Text('userAgent: ${st.userAgent}'),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
    else if (snapshot.hasError) {
              return Text("${snapshot.error.toString()}");
            }else{
      return CircularProgressIndicator();
            }
          },

        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/bloc/UserBloc.dart';
import 'package:flutter_clean_architecture/model/remote/requests/LoginRequest.dart';
import 'package:flutter_clean_architecture/model/remote/response/LoginResponse.dart';
import 'package:flutter_clean_architecture/model/remote/util/ApiResponse.dart';
import 'package:flutter_clean_architecture/view/utils/color_loader.dart';

/* Created by Sahil Bharti on 13/4/19.
 *
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Clean Arch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    /// Calling API of Login Using User Bloc
    userBloc.executeLogin(
        LoginRequest("er.sahilbharti@gmail.com", "sahilbharti123"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Get Stream and listen response of Above Login API Called from userBlock
      body: StreamBuilder<ApiResponse<LoginResponse>>(
        stream: userBloc.subject.stream,
        builder: (context, AsyncSnapshot<ApiResponse<LoginResponse>> response) {
          /// Handle  API Response  STATUS are LOADING.SUCCESS,ERROR
          if (response.data == null || response.data.status == Status.LOADING) {
            return new Center(
              child: ColorLoader(
                radius: 15.0,
                dotRadius: 6.0,
              ),
            );
          } else if (response.data.status == Status.SUCCESS) {
            /// once Response are suceces/Error we need to call this Subject dispose function
            userBloc.disposeLoginSubject();
            return Center(
                child: Text("SUCCESS : " + response.data.data.toString()));
          } else if (response.data.status == Status.ERROR) {
            /// once Response are suceces/Error we need to call this Subject dispose function
            userBloc.disposeLoginSubject();
            return Text("ERROR : " + response.data.error.toString());
          }
        },
      ),
    );
  }
}

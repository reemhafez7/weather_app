import 'package:api_project/api/controllers/user_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/user.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<List<User>>(
        future: UserApiController().getUsers(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                  return const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 45,
                   // foregroundImage: NetworkImage(snapshot.data![index].image)
                    ),
                    title: Text("Title"),
                    subtitle: Text('SubTitle'),

                  );
                }
            );
          }else {
            return  Center(child: Text("NO DATA",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),

            ),);
          }

        },
      )

    );
  }
}

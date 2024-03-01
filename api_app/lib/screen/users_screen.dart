import 'package:api_app/api/controllers/auth_api_controller.dart';
import 'package:api_app/api/controllers/users_api_controller.dart';
import 'package:api_app/models/api_response.dart';
import 'package:api_app/models/user.dart';
import 'package:api_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/images_screen'),
            icon: const Icon(Icons.image),
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: UsersApiController().getUsers(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if (snapshot.hasData && snapshot.data!.isNotEmpty){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 45,
                    foregroundImage: NetworkImage(snapshot.data![index].image),
                  ),
                  title: Text(snapshot.data![index].firstName),
                  subtitle: Text(snapshot.data![index].email),
                );

              },);
          }else {
            return Center(
              child: Text('No Data', style: GoogleFonts.poppins(
              fontSize: 30,
              color: Colors.black45,
            ),
            ),
            );
          }
        },

      ),
    );
  }
  void _logout(BuildContext context) async {
    ApiResponse response = await AuthApiController().logout();
    if(response.success){
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
    context.showSnackBar(message: response.message);
  }
}

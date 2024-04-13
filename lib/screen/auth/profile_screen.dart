import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takrorlash/screen/auth/auth_view_model/auth_view_model.dart';
import 'package:takrorlash/utils/style/app_text_style.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            Text(
              context.watch<AuthViewModel>().getUser!.displayName.toString(),
              style: AppTextStyle.interSemiBold,
            ),
           const SizedBox(height: 20,),
            Text(
              context.watch<AuthViewModel>().getUser!.email.toString(),
              style: AppTextStyle.interSemiBold,
            ),
            const SizedBox(height: 20,),
            Text(
              context.watch<AuthViewModel>().getUser!.uid.toString(),
              style: AppTextStyle.interSemiBold,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                context.read<AuthViewModel>().updateUsername("Abduvaliyev Sunnattillo2");
              });
            }, child: const Text('Update'),)
          ],
        ),
      ),
    );
  }
}

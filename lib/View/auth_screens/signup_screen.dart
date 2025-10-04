import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/Services/auth_service.dart';
import 'package:food_app/View/auth_screens/password_method_screen.dart';
import 'package:food_app/View/auth_screens/signin_screens.dart';
import 'package:food_app/View/root_screen.dart';
import 'package:food_app/utils/textUtils.dart';
import 'package:food_app/widget/reuse_btn.dart';
import 'package:food_app/widget/reuse_textform.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authservice = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    // final visibility = Provider.of<NavigationProvider>(context);
    return  SafeArea(
      child: Scaffold(
        
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [IconButton(onPressed: (){
            
        thememode.toggleTheme();
      }, icon: thememode.isDarkMode ? const Icon(Icons.brightness_5_outlined) : const Icon(Icons.dark_mode)) ],),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Center(child: Image.asset('images/Log.png' , width: 200,
                )),
                const Text('Food Ninja' , style:headingText,),
                const Text('Be healthy be Happy', style: bodyText,),
                const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.0),
                  child:  Text('Login To Your Account' , style:secondryText,),
                ),
                ReuseTextform(title: 'Email', controller: emailController),
                const SizedBox(height: 10,),
                Consumer<ThemeProvider>(builder: ((context , value , child){
                  return ReuseTextform(
                  suffixiconbutton: IconButton(onPressed: (){
                    value.toogleVisibility();
                  }, icon:value.isVisibility ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility) ),
                  isVisibility: value.isVisibility,
                  title: 'Password', controller: passwordController,
                  
                  ); 
                })),
                
                InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PasswordMethodScreen()));
                },
                child:const Align(
                  alignment: Alignment.bottomRight,
                  child:   Text('Forget your Password?' , style: greenbodyText,))),
                 SizedBox(height: 40.h,),
                
                const Text(' Continue With' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
                 SizedBox(height: 4.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          
                         const  SnackBar(content: Text('FaceBook functionality is under working')));
                      },
                      child: Container(
                      padding:const EdgeInsets.all(8),
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:thememode.isDarkMode ? const  Color.fromARGB(221, 46, 45, 45)  : Colors.white,
                          
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            Flexible(child: SvgPicture.asset('images/facebook.svg')),
                            
                           const Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: const Text('Facebook' , style: TextStyle(fontSize: 14 , fontWeight:FontWeight.w500),),
                            )
                          ],
                        ),
                      ),
                    ),
                InkWell(
              onTap: () async {
                final user = await authservice.signInWithGoogle(context);
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign Up Failed')),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
            width: 150.w,
                        height: 50.h,
                decoration: BoxDecoration(
                  color:thememode.isDarkMode ? const  Color.fromARGB(221, 46, 45, 45)  : Colors.white,
                  
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('images/google.svg'),
                     SizedBox(width: 6.w),
                    const Text(
            'Google',
            style: TextStyle(fontSize: 14 , fontWeight:FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            
                  ],
                ),
              SizedBox(height: 10.h,),
             ReuseBtn(title: 'Login' , ontap: (){
              AuthService().LoginUser(emailController.text, passwordController.text, context).then((val){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RootScreen()));
            
              }).onError((StackTrace , err){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error will occur here')));
              });
             },),
              
                 TextButton(child:const Text( "don't have an account" , style: greenbodyText,) , onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SigninScreen()));
                  }),
              // SizedBox(height: 30.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
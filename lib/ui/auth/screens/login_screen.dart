// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:icar/ui/auth/screens/signup_screen.dart';
// import 'package:icar/ui/auth/viewmodels/login_viewmodel.dart';
// import 'package:icar/ui/auth/widgets/auth_textfield.dart';
// import 'package:icar/ui/core/notification_manager.dart';
// import 'package:icar/ui/core/widgets/circular_loader.dart';
// import 'package:icar/ui/core/widgets/root_container.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() {
//     return _LoginScreenState();
//   }
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final isLoading = ref.watch(loginViewmodelProvider)?.isLoading == true;

//     ref.listen(loginViewmodelProvider, (previous, next) {
//       next?.when(
//         data: (data) {},
//         error: (error, stackTrace) {
//           NotificationManager.showSnackbar(context, error.toString());
//         },
//         loading: () {},
//       );
//     });

//     return Scaffold(
//       appBar: AppBar(title: const Text('Masuk')),
//       body: RootContainer.roundedTop(
//         padding: const EdgeInsets.only(
//           left: 16,
//           right: 16,
//           bottom: 16,
//           top: 40,
//         ),
//         child:
//             isLoading
//                 ? const Center(child: CircularLoader())
//                 : Column(
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               AuthTextfield(
//                                 label: 'Email',
//                                 hint: 'Masukkan email',
//                                 controller: emailController,
//                               ),
//                               const SizedBox(height: 24),
//                               AuthTextfield(
//                                 label: 'Password',
//                                 hint: 'Masukkan password',
//                                 isObscure: true,
//                                 controller: passwordController,
//                               ),
//                               const SizedBox(height: 24),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     if (formKey.currentState!.validate()) {
//                                       ref
//                                           .read(loginViewmodelProvider.notifier)
//                                           .loginUser(
//                                             email: emailController.text,
//                                             password: passwordController.text,
//                                           );
//                                     } else {}
//                                   },
//                                   child: Text(
//                                     'Masuk',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.labelLarge!.copyWith(
//                                       color:
//                                           Theme.of(
//                                             context,
//                                           ).colorScheme.onPrimary,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const SignupScreen(),
//                           ),
//                         );
//                       },
//                       child: RichText(
//                         text: TextSpan(
//                           text: 'Belum punya akun? ',
//                           style: Theme.of(context).textTheme.labelLarge!
//                               .copyWith(fontWeight: FontWeight.w600),
//                           children: [
//                             TextSpan(
//                               text: 'Daftar',
//                               style: Theme.of(
//                                 context,
//                               ).textTheme.labelLarge!.copyWith(
//                                 color: Theme.of(context).colorScheme.primary,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//       ),
//     );
//   }
// }

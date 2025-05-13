// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:icar/ui/auth/viewmodels/signup_viewmodel.dart';
// import 'package:icar/ui/auth/widgets/auth_textfield.dart';
// import 'package:icar/ui/core/notification_manager.dart';
// import 'package:icar/ui/core/widgets/circular_loader.dart';
// import 'package:icar/ui/core/widgets/root_container.dart';
// import 'package:icar/ui/home/screens/home_screen.dart';

// class SignupScreen extends ConsumerStatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   ConsumerState<SignupScreen> createState() {
//     return _SignupScreenState();
//   }
// }

// class _SignupScreenState extends ConsumerState<SignupScreen> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLoading = ref.watch(signupViewmodelProvider)?.isLoading == true;

//     ref.listen(signupViewmodelProvider, (previous, next) {
//       next?.when(
//         data: (data) {
//           NotificationManager.showSnackbar(
//             context,
//             'Account created successfully',
//           );
//           Navigator.of(
//             context,
//           ).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
//         },
//         error: (error, stackTrace) {
//           NotificationManager.showSnackbar(context, error.toString());
//         },
//         loading: () {},
//       );
//     });

//     return Scaffold(
//       appBar: AppBar(title: const Text('Buat akun baru')),
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
//                                 label: 'Nama',
//                                 hint: 'Masukkan nama',
//                                 controller: nameController,
//                               ),
//                               const SizedBox(height: 24),
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
//                               AuthTextfield(
//                                 label: 'Konfirmasi Password',
//                                 hint: 'Masukkan password',
//                                 isObscure: true,
//                                 controller: confirmPasswordController,
//                               ),
//                               const SizedBox(height: 24),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     if (formKey.currentState!.validate()) {
//                                       ref
//                                           .read(
//                                             signupViewmodelProvider.notifier,
//                                           )
//                                           .signupUser(
//                                             name: nameController.text,
//                                             email: emailController.text,
//                                             password: passwordController.text,
//                                           );
//                                     } else {}
//                                   },
//                                   child: Text(
//                                     'Daftar',
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
//                         Navigator.of(context).pop();
//                       },
//                       child: RichText(
//                         text: TextSpan(
//                           text: 'Sudah punya akun? ',
//                           style: Theme.of(context).textTheme.labelLarge!
//                               .copyWith(fontWeight: FontWeight.w600),
//                           children: [
//                             TextSpan(
//                               text: 'Masuk',
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

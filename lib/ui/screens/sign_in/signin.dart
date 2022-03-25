import 'package:finsem_org/ui/screens/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninCheck extends StatelessWidget {
  const SigninCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.data != null) {
              return FutureBuilder<IdTokenResult>(
                  future: snapshot.data!.getIdTokenResult(),
                  builder: (context, AsyncSnapshot<IdTokenResult> value) {
                    if (value.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (value.data!.claims!['manager'] == true) {
                        return const Dashboard();
                      } else {
                        Fluttertoast.showToast(
                          msg: "Organization Does Not Exists, Loggin Out!",
                          backgroundColor: Colors.red.shade700,
                          textColor: Colors.white,
                        ).then(
                          (value) => {
                            auth.signOut(),
                          },
                        );
                      }
                      return Container();
                    }
                  });
            } else {
              return const SigninForm();
            }
          }
        },
      ),
    );
  }
}

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  TextEditingController? _emailController;
  TextEditingController? _psswdController;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    _emailController = TextEditingController();
    _psswdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _psswdController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextFormField(
            controller: _psswdController,
            keyboardType: TextInputType.visiblePassword,
            obscuringCharacter: "*",
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              try {
                auth.signInWithEmailAndPassword(
                  email: _emailController!.text,
                  password: _psswdController!.text,
                );
              } on FirebaseAuthException catch (e) {
                // ignore: avoid_print
                print(e);
                Fluttertoast.showToast(msg: 'e');
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_screen/constants.dart';
import 'package:flutter_login_screen/model/user.dart';
import 'package:flutter_login_screen/services/helper.dart';
import 'package:flutter_login_screen/ui/auth/authentication_bloc.dart';
import 'package:flutter_login_screen/ui/auth/welcome/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.authState == AuthState.unauthenticated) {
          pushAndRemoveUntil(context, const WelcomeScreen(), false);
        }
      },
      child:         MyHomePage(title: "Ngo"),


      // child: Scaffold(
      //   drawer: Drawer(
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: [
      //         const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Color(colorPrimary),
      //           ),
      //           child: Text(
      //             'Drawer Header',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //         ListTile(
      //           title: Text(
      //             'Logout',
      //             style: TextStyle(
      //                 color: isDarkMode(context)
      //                     ? Colors.grey.shade50
      //                     : Colors.grey.shade900),
      //           ),
      //           leading: Transform.rotate(
      //             angle: pi / 1,
      //             child: Icon(
      //               Icons.exit_to_app,
      //               color: isDarkMode(context)
      //                   ? Colors.grey.shade50
      //                   : Colors.grey.shade900,
      //             ),
      //           ),
      //           onTap: () {
      //             context.read<AuthenticationBloc>().add(LogoutEvent());
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      //   appBar: AppBar(
      //     title: Text(
      //       'Home',
      //       style: TextStyle(
      //           color: isDarkMode(context)
      //               ? Colors.grey.shade50
      //               : Colors.grey.shade900),
      //     ),
      //     iconTheme: IconThemeData(
      //         color: isDarkMode(context)
      //             ? Colors.grey.shade50
      //             : Colors.grey.shade900),
      //     backgroundColor:
      //         isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade50,
      //     centerTitle: true,
      //   ),
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       mainAxisSize: MainAxisSize.max,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         user.profilePictureURL == ''
      //             ? CircleAvatar(
      //                 radius: 35,
      //                 backgroundColor: Colors.grey.shade400,
      //                 child: ClipOval(
      //                   child: SizedBox(
      //                     width: 70,
      //                     height: 70,
      //                     child: Image.asset(
      //                       'assets/images/placeholder.jpg',
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ),
      //               )
      //             : displayCircleImage(user.profilePictureURL, 80, false),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(user.fullName()),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(user.email),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(user.userID),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
 }
// import 'package:autentic_apps/user.dart';
// import 'package:autentic_apps/theme/color.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:google_fonts/google_fonts.dart';
//
// import 'get_started/get_started.dart';
//
// class Home extends StatefulWidget {
//   static String routeName = "/home";
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   User? user = FirebaseAuth.instance.currentUser;
//   User loggedInUser = User();
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = User.fromMap(value.data());
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimalListScreen(),
//
//     );
//   }
//
//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context)
//         .pushReplacement(MaterialPageRoute(builder: (context) => Onboarding()));
//   }
// }
//
// class AnimalListScreen extends StatefulWidget {
//   @override
//   _AnimalListScreenState createState() => _AnimalListScreenState();
// }
//
// class _AnimalListScreenState extends State<AnimalListScreen> {
//   final TextEditingController _searchController = TextEditingController();
//
//   List<String> _animals = [
//     'Edhi Foundation',
//     'Shaukat Khanum',
//     'Akhuwat',
//     'Pakistan Poverty Alleviation Fund',
//     'The Citizens Foundation',
//     'Fatimid Foundation',
//     'Zindagi Trust',
//     'Sindh Institute of Urology and Transplantation',
//     'Al Mustafa Welfare Society',
//   ];
//
//   List<String> _filteredAnimals = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredAnimals.addAll(_animals);
//   }
//
//   void _filterAnimals(String searchText) {
//     _filteredAnimals.clear();
//
//     if (searchText.isEmpty) {
//       _filteredAnimals.addAll(_animals);
//     } else {
//       _animals.forEach((animal) {
//         if (animal.toLowerCase().contains(searchText.toLowerCase())) {
//           _filteredAnimals.add(animal);
//         }
//       });
//     }
//
//     setState(() {});
//   }
//
//   void _onAnimalTap(String animalName) {
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => AnimalDetailsScreen(animalName: animalName),
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: TextField(
//           controller: _searchController,
//           onChanged: _filterAnimals,
//           decoration: InputDecoration(
//             fillColor: Colors.white,
//             hintText: 'Search...',
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _filteredAnimals.length,
//         itemBuilder: (context, index) {
//           final animalName = _filteredAnimals[index];
//           return InkWell(
//             onTap: () => _onAnimalTap(animalName),
//             child: ListTile(
//               title: Text(animalName),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class AnimalDetailsScreen extends StatelessWidget {
//   final String animalName;
//
//   const AnimalDetailsScreen({Key? key, required this.animalName})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(animalName),
//       ),
//       body: Center(
//         child: Text('Details about $animalName'),
//       ),
//     );
//   }
// }
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [    'Edhi Foundation',    'Shaukat Khanum Memorial Cancer Hospital and Research Centre ',    'The Citizens Foundation (TCF)',    'Behbud Association',    'Sughar Foundation',    'The Hunar Foundation',    'Saylani Welfare International Trust',    'Developments in Literacy (DIL)',    'Pakistan Red Crescent Society',    "SOS Children's Villages Pakistan",  ];

  List<String> filteredItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(items);
  }

  void filterSearchResults(String query) {
    List<String> searchResults = [];

    if (query.isNotEmpty) {
      items.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });

      setState(() {
        filteredItems.clear();
        filteredItems.addAll(searchResults);
      });
    } else {
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(items);
      });
    }
  }

  void navigateToDetailScreen(String item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                  onTap: () {
                    navigateToDetailScreen(filteredItems[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: Center(
        child: Text(item),
      ),
    );
  }
}
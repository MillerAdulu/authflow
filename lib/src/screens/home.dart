import 'package:authflow/src/models/_index.dart';
import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';

import 'package:authflow/src/managers/_index.dart';
import 'package:authflow/src/utils/_index.dart';

import 'package:authflow/src/screens/decision.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeParent(),
    );
  }
}

class HomeParent extends StatefulWidget {
  @override
  _HomeParentState createState() => _HomeParentState();
}

class _HomeParentState extends State<HomeParent> {
  RxCommandListener _userLogout;

  @override
  void initState() {
    super.initState();

    sl<VirusManager>().getViruses();

    _userLogout = RxCommandListener(
      sl<AuthManager>().signOutUser,
      onValue: (_) => _onValueSignOut(),
      onError: (error) => _onErrorSignOut(error),
    );
  }

  @override
  void dispose() {
    _userLogout?.dispose();
    super.dispose();
  }

  void _onValueSignOut() {
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DecisionPage(),
        ),
      );
    });
  }

  void _onErrorSignOut(dynamic error) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('${error.toString()}'),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CommandResult<bool>>(
      stream: sl<AuthManager>().signOutUser.results,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final result = snapshot.data;

        if (result != null) {
          if (result.isExecuting)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (result.hasError) return _buildPage();
        }

        return _buildPage();
      },
    );
  }

  Widget _buildPage() {
    return Center(
      child: StreamBuilder<List<Virus>>(
        stream: sl<VirusManager>().getViruses,
        builder: (context, snap) {
          if (snap.data != null)
            return ListView.builder(
                itemBuilder: (cont, i) => ListTile(
                      title: Text(snap.data[i].virusName),
                    ));
          return CircularProgressIndicator();
        },
      ),
    );
  }

  void signOut() async {
    sl<AuthManager>().signOutUser('Super Token');
  }
}

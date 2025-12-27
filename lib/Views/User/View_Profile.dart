import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/ViewModels/User/User_ViewModel.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<UserViewModel>().loadProfile());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();

    if (vm.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (vm.user == null) {
      return const Scaffold(
        body: Center(child: Text('No profile found')),
      );
    }

    final user = vm.user!;

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 40, child: Text(user.name[0])),
            const SizedBox(height: 16),
            Text('${user.name} ${user.surname}',
                style: const TextStyle(fontSize: 18)),
            Text(user.email),
            Text(user.phone),
          ],
        ),
      ),
    );
  }
}

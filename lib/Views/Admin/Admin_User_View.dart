import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/ViewModels/Admin/Admin_User_ViewModel.dart';

class AdminUserListScreen extends StatefulWidget {
  const AdminUserListScreen({super.key});

  @override
  State<AdminUserListScreen> createState() => _AdminUserListScreenState();
}

class _AdminUserListScreenState extends State<AdminUserListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<AdminUserViewModel>().loadUsers());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AdminUserViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Admin • Users')),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: vm.users.length,
        itemBuilder: (_, index) {
          final user = vm.users[index];
          return ListTile(
            title: Text('${user.name} ${user.surname}'),
            subtitle: Text(user.email),
            trailing: Text(user.role),
          );
        },
      ),
    );
  }
}

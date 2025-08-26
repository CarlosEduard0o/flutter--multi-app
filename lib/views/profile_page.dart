import 'package:flutter/material.dart';
import 'package:multi_app/components/app_bar.dart';
import 'package:multi_app/components/responsive_container.dart';
import 'package:multi_app/models/user.dart';
import 'package:multi_app/shared/app_constants.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: AppConstants.appName),
      body: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              child: user.image != null
                  ? Image.network(user.image!)
                  : Icon(Icons.person),
            ),
            SizedBox(height: 16.0),
            Text(
              '${user.firstName} ${user.lastName ?? ''}',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(user.email),
            SizedBox(height: 24.0),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildProfileRow(
                      icon: Icons.badge,
                      label: 'ID',
                      text: user.id.toString(),
                      theme: Theme.of(context),
                    ),
                    Divider(),
                    _buildProfileRow(
                      icon: Icons.person,
                      label: 'Nome',
                      text: '${user.firstName} ${user.lastName ?? ''}',
                      theme: Theme.of(context),
                    ),
                    Divider(),
                    _buildProfileRow(
                      icon: Icons.email,
                      label: 'E-mail',
                      text: user.email,
                      theme: Theme.of(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow({
    required IconData icon,
    required String label,
    required String text,
    required ThemeData theme,
  }) {
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.end,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

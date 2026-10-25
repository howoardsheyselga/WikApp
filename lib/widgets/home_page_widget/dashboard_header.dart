import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wikapp_beta/utils/account_preferences_helper.dart';

class DashboardHeader extends StatefulWidget {
  final bool showProfileAvatar;
  final VoidCallback? onProfileTap;

  const DashboardHeader({
    super.key,
    this.showProfileAvatar = true,
    this.onProfileTap,
  });

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  String _avatarPath = 'assets/vectors/profile_avatar.png';

  @override
  void initState() {
    super.initState();
    _loadUserAvatar();
    AccountPreferencesHelper.accountChangeNotifier.addListener(_loadUserAvatar);
  }

  @override
  void dispose() {
    AccountPreferencesHelper.accountChangeNotifier.removeListener(_loadUserAvatar);
    super.dispose();
  }

  Future<void> _loadUserAvatar() async {
    try {
      final details = await AccountPreferencesHelper.getAccountDetails();
      if (mounted) {
        setState(() {
          _avatarPath = details['avatarPath'] ?? 'assets/vectors/profile_avatar.png';
        });
      }
    } catch (_) {}
  }

  Widget _buildHeaderAvatar(String path) {
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        width: 36,
        height: 36,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.person_rounded, size: 24, color: Color(0xFF1E293B)),
      );
    } else {
      return Image.file(
        File(path),
        width: 36,
        height: 36,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.person_rounded, size: 24, color: Color(0xFF1E293B)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 38,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const SizedBox(height: 38, width: 100),
        ),
        if (widget.showProfileAvatar)
          GestureDetector(
            onTap: widget.onProfileTap,
            child: ClipOval(
              child: _buildHeaderAvatar(_avatarPath),
            ),
          ),
      ],
    );
  }
}
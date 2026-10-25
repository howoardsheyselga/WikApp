import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wikapp_beta/utils/account_preferences_helper.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late TextEditingController _nameController;
  late TextEditingController _gradeSectionController;

  String _accountId = '';
  String _regDate = '';
  String _status = 'Offline / Lokal na Account';
  String _selectedAvatarPath = 'assets/vectors/profile_avatar.png';
  bool _isLoading = true;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _gradeSectionController = TextEditingController();
    _loadSavedAccountData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _gradeSectionController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedAccountData() async {
    try {
      final details = await AccountPreferencesHelper.getAccountDetails();
      if (mounted) {
        setState(() {
          _nameController.text = details['name']!;
          _gradeSectionController.text = details['gradeSection']!;
          _accountId = details['accountId']!;
          _regDate = details['regDate']!;
          _status = details['status']!;
          _selectedAvatarPath = details['avatarPath']!;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (pickedFile != null && mounted) {
        setState(() {
          _selectedAvatarPath = pickedFile.path;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hindi maiproseso ang napiling larawan.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _saveChanges() async {
    if (_nameController.text.trim().isEmpty ||
        _gradeSectionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mangyaring punan ang lahat ng kinakailangang field.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await AccountPreferencesHelper.saveAccountDetails(
      name: _nameController.text,
      gradeSection: _gradeSectionController.text,
      avatarPath: _selectedAvatarPath,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Matagumpay na na-save ang mga pagbabago!'),
          backgroundColor: Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _showAvatarPickerModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFFFFFDF8),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Palitan ang Larawan ng Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.photo_library_rounded,
                    color: Color(0xFFC86D51)),
              ),
              title: const Text(
                'Pumili sa Gallery / Device',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              subtitle: const Text(
                'Mag-upload ng larawan mula sa iyong storage',
                style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFD8EBE4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.camera_alt_rounded,
                    color: Color(0xFF388E8E)),
              ),
              title: const Text(
                'Kumuha sa Camera',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              subtitle: const Text(
                'Kumuha ng bagong litrato gamit ang camera',
                style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            const SizedBox(height: 8),
            if (!_selectedAvatarPath.startsWith('assets/'))
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.restore_rounded,
                      color: Color(0xFF64748B)),
                ),
                title: const Text(
                  'Ibalik sa Default Avatar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedAvatarPath = 'assets/vectors/profile_avatar.png';
                  });
                  Navigator.pop(context);
                },
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  void _editFieldModal({
    required String title,
    required TextEditingController controller,
  }) {
    final tempController = TextEditingController(text: controller.text);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 24,
          left: 20,
          right: 20,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFFFFDF8),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Baguhin ang $title',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: tempController,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFAF6EE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: Color(0xFF2D2B2A), width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: Color(0xFFC86D51), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC86D51),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    controller.text = tempController.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  'I-update',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarWidget(String path, {required double size}) {
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.person_rounded,
          size: 50,
          color: Colors.white,
        ),
      );
    } else {
      return Image.file(
        File(path),
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.person_rounded,
          size: 50,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFFC86D51)),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF0F172A),
                        size: 26,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Impormasyon ng Account',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Iyong mga personal na detalye sa offline account',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: _showAvatarPickerModal,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6B6291),
                                  ),
                                  child: CircleAvatar(
                                    radius: 44,
                                    backgroundColor: const Color(0xFFD6D0F2),
                                    child: ClipOval(
                                      child: _buildAvatarWidget(
                                        _selectedAvatarPath,
                                        size: 80,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.12),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.edit_rounded,
                                    size: 16,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: _showAvatarPickerModal,
                            child: const Text(
                              'Palitan ang Larawan',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildAccountCard(
                      label: 'Pangalan',
                      value: _nameController.text,
                      assetPath: 'assets/images/idicon.png',
                      fallbackIcon: Icons.badge_outlined,
                      bgColor: const Color(0xFFFDE8E1),
                      iconColor: const Color(0xFFC86D51),
                      trailingWidget: IconButton(
                        icon: const Icon(Icons.edit_rounded,
                            size: 18, color: Color(0xFF1E293B)),
                        onPressed: () => _editFieldModal(
                          title: 'Pangalan',
                          controller: _nameController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildAccountCard(
                      label: 'Baitang at Sekksyon',
                      value: _gradeSectionController.text,
                      assetPath: 'assets/images/ribbon_icon.png',
                      fallbackIcon: Icons.workspace_premium_rounded,
                      bgColor: const Color(0xFFFDE0D9),
                      iconColor: const Color(0xFFDE7B59),
                      trailingWidget: IconButton(
                        icon: const Icon(Icons.edit_rounded,
                            size: 18, color: Color(0xFF1E293B)),
                        onPressed: () => _editFieldModal(
                          title: 'Baitang at Sekksyon',
                          controller: _gradeSectionController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildAccountCard(
                      label: 'ID ng Account (Hindi nababago)',
                      value: _accountId,
                      assetPath: 'assets/images/account_id_icon.png',
                      fallbackIcon: Icons.perm_identity_rounded,
                      bgColor: const Color(0xFFD8EBE4),
                      iconColor: const Color(0xFF388E8E),
                      trailingWidget: const Icon(
                        Icons.lock_rounded,
                        size: 18,
                        color: Color(0xFF525F7F),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildAccountCard(
                      label: 'Petsa ng Pagrehistro',
                      value: _regDate,
                      assetPath: 'assets/images/calendar_icon.png',
                      fallbackIcon: Icons.calendar_month_rounded,
                      bgColor: const Color(0xFFF5E3CE),
                      iconColor: const Color(0xFFC08A5E),
                    ),
                    const SizedBox(height: 12),
                    _buildAccountCard(
                      label: 'Katayuan',
                      value: _status,
                      assetPath: 'assets/images/globe_icon.png',
                      fallbackIcon: Icons.language_rounded,
                      bgColor: const Color(0xFFE8EFCB),
                      iconColor: const Color(0xFF8A9A5B),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD66839),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: _saveChanges,
                        child: const Text(
                          'I-save ang mga Pagbabago',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildAccountCard({
    required String label,
    required String value,
    required String assetPath,
    required IconData fallbackIcon,
    required Color bgColor,
    required Color iconColor,
    Widget? trailingWidget,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                fallbackIcon,
                size: 26,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
          if (trailingWidget != null) trailingWidget,
        ],
      ),
    );
  }
}
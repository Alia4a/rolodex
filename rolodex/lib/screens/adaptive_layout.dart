import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'contact_groups.dart';

const largScreenMinWidth = 600;

class AdaptiveLayout extends StatefulWidget {
  const AdaptiveLayout({super.key});

  @override
  State<AdaptiveLayout> createState() => _AdaptiveLayoutState();
}

class _AdaptiveLayoutState extends State<AdaptiveLayout>{
  int selectedListId = 0;

  void _onContactListSelected(int listId){
    setState(() {
      selectedListId = listId;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        final isLargeScreen = constraints.maxWidth > largScreenMinWidth;

        if (isLargeScreen){
          return _buildLargeScreenLayout();
        } else {
          return const ContactGroupsPage();
        }
      }
    );
  }

  Widget _buildLargeScreenLayout(){
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Row(
          children: [
            const SizedBox(width: 320, child: Text('Sidebar Placeholder')),
            Container(width: 1, color: CupertinoColors.inactiveGray),
            const Expanded(child: Text('Details Placeholder')),
          ],
        ),
      ),
    );
  }
}
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu
          ),
        if (Responsive.isDesktop(context))
          Text(
            "Desktop",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.w700
            ),
          ),
        if(Responsive.isMobile(context))
          Text(
            "Mobile",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontSize: 20
            ),
          ),

        if(Responsive.isTablet(context))
          Text(
            "Tablet",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: primaryColor,
                fontSize: 24
            ),
          ),
        if (Responsive.isMobile(context)) SizedBox(width: 12,),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            height: defaultPadding*2,
            width: defaultPadding*2,
            child: Icon(Icons.person),
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle
            )
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Humayun Kabir"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}

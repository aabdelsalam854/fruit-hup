import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frute_hup/core/styles/lang/lang_cubit.dart';
import 'package:frute_hup/core/utils/app_images.dart';
import 'package:frute_hup/generated/l10n.dart';

import '../../../../../core/styles/cubit/theme_cubit.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        // leading: SvgPicture.asset(AppImages.imagesProfileImage),
        title: Text(
          S.of(context).homeAppBarTitle,
          style: TextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
        ),
        subtitle: Text(S.of(context).homeAppBarTitle, style: TextStyles.bold16),
        trailing: GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().changeTheme();
            context.read<LanguageCubit>().changeLanguages();
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const ShapeDecoration(
                  shape: OvalBorder(), color: Color(0XFFEEF8ED)),
              child: SvgPicture.asset(AppImages.imagesNotification)),
        ),
      ),
    );
  }
}

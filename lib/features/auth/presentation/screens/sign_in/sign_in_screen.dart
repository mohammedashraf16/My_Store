import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/components/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/components/dialog_utils.dart';
import 'package:e_commerce/core/utils/components/main_text_field.dart';
import 'package:e_commerce/core/utils/components/validators.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/core/utils/font_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_ds_impl.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          LoginUseCase(
            AuthRepoImpl(
              AuthRemoteDsImpl(ApiManager()),
            ),
          ),
          SignUpUseCase(
            AuthRepoImpl(
              AuthRemoteDsImpl(ApiManager()),
            ),
          )),
      child: BlocConsumer<AuthBloc, AuthLoginState>(
        listener: (context, state) {
          if (state.requestState == RequestState.loading) {
            DialogUtils.showLoading(context: context, message: "Loading...");
          } else if (state.requestState == RequestState.error) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.errorMessage!,
                title: "Error",
                posActionName: "OK");
          } else {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'Login Successfully.',
                title: 'Success',
                posActionName: 'Ok');
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainRoute, (r) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Text(
                        'Welcome Back To Route',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: getLightStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      BuildTextField(
                        controller: emailController,
                        backgroundColor: ColorManager.white,
                        hint: 'enter your name',
                        label: 'User name',
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                      ),
                      SizedBox(
                        height: AppSize.s28.h,
                      ),
                      BuildTextField(
                        controller: passwordController,
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'Password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(color: ColorManager.white)
                                    .copyWith(fontSize: FontSize.s18.sp),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s60.h,
                      ),
                      Center(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * .8,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            isStadiumBorder: false,
                            label: 'Login',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18),
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                                  emailController.text,
                                  passwordController.text));
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.signUpRoute),
                            child: Text(
                              'Create Account',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

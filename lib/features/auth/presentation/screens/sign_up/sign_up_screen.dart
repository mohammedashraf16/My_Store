import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/components/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/components/dialog_utils.dart';
import 'package:e_commerce/core/utils/components/main_text_field.dart';
import 'package:e_commerce/core/utils/components/validators.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_ds_impl.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/entity/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();

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
                message: 'SignUp Successfully.',
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
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                        controller: nameController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                        controller: passwordController,
                      ),
                      BuildTextField(
                        hint: 'enter your rePassword',
                        backgroundColor: ColorManager.white,
                        label: 'rePassword',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                        controller: rePasswordController,
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            label: 'Sign Up',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s20),
                            onTap: () {
                              final signUpEntity = SignUpEntity(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  rePassword: rePasswordController.text,
                                  phone: phoneController.text);

                              BlocProvider.of<AuthBloc>(context)
                                  .add(SignupEvent(signUpEntity));
                            },
                          ),
                        ),
                      ),
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

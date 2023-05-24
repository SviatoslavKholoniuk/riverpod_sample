import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/common/validators/email_validator.dart';
import 'package:riverpod_flutter/common/widgets/primary_button.dart';
import 'package:riverpod_flutter/routes/app_route.dart';

import '../../../../../common/resources/colors.dart';
import '../../../../../common/resources/input_styles.dart';
import '../../../../../common/resources/text_styles.dart';
import 'provider/login_notifier.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    _handleEvents(context, ref);

    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 60),
                _signInHeader(),
                const SizedBox(height: 48),
                _buildEmailInput(ref),
                const SizedBox(height: 24),
                _passwordInput(ref),
                const SizedBox(height: 50),
                _signInButton(ref),
                const SizedBox(height: 64),
                _register(context),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInHeader() {
    return Column(
      children: [
        Text(
          "Let’s sign you in.",
          style: AppTextStyle.title01.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          "Welcome back.\nYou’ve been missed!",
          style: AppTextStyle.titleSecondary.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInput(WidgetRef ref) {
    return TextFormField(
      validator: EmailValidator.validate,
      onChanged: (text) => ref.read(loginProvider.notifier).emailChanged(text),
      style: AppTextStyle.bodyInput.copyWith(color: AppColors.textPrimary),
      decoration: InputStyles.inputBaseDecoration.copyWith(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordInput(WidgetRef ref) {
    return TextField(
      onChanged: (text) =>
          ref.read(loginProvider.notifier).passwordChanged(text),
      style: AppTextStyle.bodyInput.copyWith(color: AppColors.textPrimary),
      decoration: InputStyles.inputBaseDecoration.copyWith(
        hintText: 'Password',
      ),
    );
  }

  Widget _signInButton(WidgetRef ref) {
    var canContinue = ref.watch(loginProvider).canContinue;
    var loading = ref.watch(loginProvider).isLoading;
    return PrimaryButton(
      title: "Sign in",
      isLoading: loading,
      onPressed:
          canContinue ? () => ref.watch(loginProvider.notifier).login() : null,
    );
  }

  Widget _register(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(const SignUpRoute()),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account?",
                style: TextStyle(color: AppColors.textSecondary),
              ),
              TextSpan(
                text: " Register",
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleEvents(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (previous, next) {
      if (next.success != null) {
        context.router.navigate(const HomeRoute());
      }

      var errorMessage = next.error?.getContent;
      if (errorMessage != null && errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });
  }
}

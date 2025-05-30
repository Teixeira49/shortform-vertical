part of '../page/profile_info_page.dart';

class _ProfileInfoBody extends StatelessWidget {
  const _ProfileInfoBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profileLabel),
        actions: [
          IconButton(
            onPressed: () => context.push(NotificationsPage.path),
            icon: const Icon(Icons.notifications_outlined),
          ),
          BlocBuilder<SignOutBloc, SignOutState>(builder: (context, state) {
            return IconButton(
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (BuildContext context) {
                  return selectOption(
                    context,
                  );
                },
              ),
              icon: const Icon(Icons.more_vert_outlined),
            );
          })
        ],
        actionsPadding: EdgeInsets.only(right: WidthValues.padding),
      ),
      body: BlocBuilder<GetCurrentUserBloc, GetCurrentUserState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          final user = state.user;
          final status = state.status;

          final isLoading = status.isLoading || status.isInitial;

          Widget? body;

          if (status.isFailure) {
            body = Center(
              child: OnErrorWidget(
                icon: Icons.close,
                iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                onRetry: () => context
                    .read<GetCurrentUserBloc>()
                    .add(GetCurrentUserRetryButtonPressed()),
              ),
            );
          }

          if (isLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorValues.fgBrandPrimary(context),
            ));
          }

          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context
                  .read<GetCurrentUserBloc>()
                  .add(GetCurrentUserRetryButtonPressed());
            },
            child: body ??
                BaseLayout(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: WidthValues.spacingSm,
                      children: [
                        Gap(WidthValues.spacingSm),
                        ProfileHeader(
                          user: user,
                        ),
                        Gap(WidthValues.spacingSm),
                        ProfileInfoSection(
                          sectionName: context.l10n.historyLabel,
                          viewsRoute: 1,
                        ),
                        ProfileInfoSection(
                          sectionName: context.l10n.likedLabel,
                          viewsRoute: 2,
                        ),
                        ProfileInfoSection(
                          sectionName: context.l10n.bookmarksLabel,
                          viewsRoute: 3,
                        ),
                        Gap(WidthValues.spacingSm),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.download),
                          title: Text(context.l10n.searchYourDownloadsLabel),
                          trailing: Icon(Icons.navigate_next),
                          onTap: () => CustomSnackBar.showWarningBar(
                              context, context.l10n.snackBarWarningDemo),
                        ),
                        Divider(),
                        Text("ver. 1.0.0+1"),
                        Gap(WidthValues.spacingSm),
                      ],
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }

  Widget selectOption(context) {
    bool check = false;

    void outStatus(context, check) {
      if (check) {
        context.read<SignOutBloc>().add(SignOutButtonPressed());
      }
    }

    return Column(
      children: [
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('Edit Profile'),
          leading: Icon(Icons.edit_outlined),
          onTap: () => CustomSnackBar.showWarningBar(
              context, context.l10n.snackBarWarningDemo),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('About my account'),
          leading: Icon(Icons.account_circle_outlined),
          onTap: () => CustomSnackBar.showWarningBar(
              context, context.l10n.snackBarWarningDemo),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('Settings'),
          leading: Icon(Icons.settings_outlined),
          onTap: () => CustomSnackBar.showWarningBar(
              context, context.l10n.snackBarWarningDemo),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('Help'),
          leading: Icon(Icons.help_outline),
          onTap: () => CustomSnackBar.showWarningBar(
              context, context.l10n.snackBarWarningDemo),
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('Get Premium'),
          leading: Icon(Icons.star_border_outlined),
          onTap: () => context.push(PremiumPaywallPage.path),
        ),
        ListTile(
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Log out'),
            leading: Icon(Icons.logout),
            onTap: () {
              check = true;
              outStatus(context, check);
              Navigator.pop(context);
            })
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(WidthValues.spacingLg),
        CircleAvatar(
          radius: 50,
          backgroundImage: user.imageUrl.isNotEmpty && user.imageUrl != ''
              ? NetworkImage(user.imageUrl)
              : Image.asset(AssetIcons.defaultAvatar).image,
        ),
        Gap(WidthValues.spacing2Md),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: WidthValues.spacingXxs,
          children: [
            Text(
              user.fullName,
              style: ExtendedTextTheme.textMedium(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.email,
              style: ExtendedTextTheme.textSmall(context).copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Row(
              spacing: WidthValues.spacingXs,
              children: [
                selectCustomTag(
                  context,
                  user.plan,
                ),
                selectCustomTag(
                  context,
                  user.verified
                      ? AppConstants.verifiedUser
                      : AppConstants.unverifiedUser,
                ),
              ],
            )
          ],
        ),
        Gap(WidthValues.spacingMd),
      ],
    );
  }

  Widget selectCustomTag(BuildContext context, String tagName) {
    switch (tagName) {
      case AppConstants.verifiedUser:
        return CustomTag.green(context: context, child: Text(tagName));
      case AppConstants.unverifiedUser:
        return CustomTag.red(context: context, child: Text(tagName));
      case AppConstants.freePlan:
        return CustomTag.yellow(context: context, child: Text(tagName));
      case AppConstants.premiumPlan:
        return CustomTag.pink(context: context, child: Text(tagName));
      case AppConstants.enterprisePlan:
        return CustomTag.purple(context: context, child: Text(tagName));
      default:
        return CustomTag.yellow(context: context, child: Text(tagName));
    }
  }
}

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection(
      {super.key, required this.sectionName, required this.viewsRoute});

  final String sectionName;
  final int viewsRoute; // TODO change for a enum

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryBloc, FetchHistoryState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          final status = state.status;
          final feedVideos = state.feedVideos;

          Widget? body;

          if (status.isError) {
            body = Center(
              child: OnErrorWidget(
                iconSize: 30,
                icon: Icons.close_outlined,
                iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                onRetry: () => context
                    .read<FetchHistoryBloc>()
                    .add(const FetchFeedVideosEvent(userId: 1)),
              ),
            );
          }

          if (feedVideos.isEmpty && !status.isLoading) {
            body = Center(
              child: OnErrorWidget(
                iconSize: 30,
                icon: Icons.not_interested,
                iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                onRetry: () => context
                    .read<FetchHistoryBloc>()
                    .add(const FetchFeedVideosEvent(userId: 1)),
              ),
            );
          }

          return body ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sectionName,
                        style: ExtendedTextTheme.textMedium(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            context.pushNamed(ProfileHistoryPage.routeName,
                                extra: viewsRoute);
                          },
                          child: Text(context.l10n.viewAllLabel))
                    ],
                  ),
                  Gap(WidthValues.spacingMd),
                  //body ??
                  _ViewsCarousel(
                      views: feedVideos,
                      isLoading: false //status.isLoading || status.isInitial,
                      ),
                ],
              );
        });
  }
}

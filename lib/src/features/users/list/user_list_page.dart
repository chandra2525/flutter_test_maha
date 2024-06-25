import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../widgets/empty_list_state_widget.dart';
import 'component/user_list_controller.dart';

class UserListPage extends GetWidget<UserListController> {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: lightGray,
        body: Obx(
          () => (controller.isLoadingRetrieveUser)
              ? const Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primary),
                ))
              : SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Discover',
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: gray900,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 24.0, bottom: 18.0, left: 24.0),
                        child: Text(
                          'Recomended User',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: gray900,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      (controller.users.value.isEmpty)
                          ? const Center(
                              child: EmptyListStateWidget(
                                text: "No user to show",
                              ),
                            )
                          : buildUserList(context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildUserList(BuildContext context) => Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),

            // shrinkWrap: true,
            itemCount: controller.users.value.length,
            itemBuilder: (context, index) {
              final user = controller.users.value[index];
              return Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  shadows: const [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    {
                      controller.idTxt.value = user.id.toString();
                      controller.emailTxt.value = user.email;
                      controller.firstNameTxt.value = user.firstName;
                      controller.lastNameTxt.value = user.lastName;
                      controller.avatarTxt.value = user.avatar;

                      controller.sendUsers();
                    }
                  },
                  child: Container(
                    // height: 200,
                    // color: white,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: user.avatar,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error_outline,
                                color: gray600,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  user.firstName,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: gray600,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  user.lastName,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.email_outlined,
                                  color: gray600,
                                  size: 18.0,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  user.email,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: gray600,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
}

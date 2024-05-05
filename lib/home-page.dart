import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'app_styles.dart';
import 'job_card.dart';
import 'job_detail_page.dart';
import 'size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildSearchBar(),
      backgroundColor: kWhiteF5,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildJobList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      height: 52,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kBluePrimary,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: kPoppinsMedium.copyWith(color: kWhite),
              controller: TextEditingController(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset('assets/icon_search.svg'),
                ),
                hintText: 'Type the jobs you want to search',
                hintStyle: kPoppinsMedium.copyWith(color: kWhiteF5),
                filled: false,
                border: _buildOutlineInputBorder(),
                errorBorder: _buildOutlineInputBorder(),
                enabledBorder: _buildOutlineInputBorder(),
                focusedBorder: _buildOutlineInputBorder(),
                disabledBorder: _buildOutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const VerticalDivider(color: kBluePrimary, thickness: 1),
          const SizedBox(width: 12),
          SvgPicture.asset('assets/icon_filter_list.svg'),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: kBluePrimary),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            'https://img.favpng.com/25/13/19/samsung-galaxy-a8-a8-user-login-telephone-avatar-png-favpng-dqKEPfX7hPbc6SMVUCteANKwj.jpg',
          ),
        ),
        SvgPicture.asset('assets/icon_notification_none.svg'),
      ],
    );
  }

  Widget _buildJobList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '40 JOBS FOUND',
          style: kPoppinsBold.copyWith(
            color: kBlack18,
            fontSize: SizeConfig.blockSizeHorizontal! * 3,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return JobCard(
              position: 'Head of Product Design',
              company: 'Uber',
              companyImage:
                  'https://imagedynamics.co.id/wp-content/uploads/2018/09/client_logo/Logo_UBER.png',
              status: 'applied',
              types: const [
                'Full Time',
                'Remote',
                'Contractual',
              ],
              salary: '\$20k - \$35k',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JobDetailPage(),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

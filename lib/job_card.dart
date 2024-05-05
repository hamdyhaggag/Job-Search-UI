import 'package:flutter/material.dart';
import 'package:job_search_ui/size_config.dart';
import 'app_styles.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.position,
    required this.company,
    required this.companyImage,
    required this.status,
    required this.salary,
    required this.types,
    required this.onTap,
  }) : super(key: key);

  final String position, company, companyImage, status, salary;
  final List<String> types;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 113,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhite,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                color: kShadow.withOpacity(0.05),
                spreadRadius: 0,
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildJobDetails(),
              _buildJobTypesAndSalary(),
            ],
          ),
        ),
      );

  Widget _buildJobDetails() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCompanyDetails(),
          jobStatus(),
        ],
      );

  Widget _buildCompanyDetails() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(companyImage),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                position,
                style: kPoppinsSemibold.copyWith(
                  color: kBlack18,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                ),
              ),
              Text(
                company,
                style: kPoppinsMedium.copyWith(
                  color: kBlack18,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildJobTypesAndSalary() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 21,
              child: ListView.builder(
                itemCount: types.length >= 2 ? 2 : types.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kWhiteF5,
                  ),
                  child: Center(
                    child: Text(
                      types[index],
                      style: kPoppinsMedium.copyWith(
                        color: kBlack18,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            '$salary/yearly',
            style: kPoppinsRegular.copyWith(
              color: kBlack18,
              fontSize: SizeConfig.blockSizeHorizontal! * 3,
            ),
          ),
        ],
      );

  Widget jobStatus() {
    switch (status) {
      case 'expires':
        return _buildStatusContainer(
          color: kYellowExpires,
          icon: Icons.warning,
          text: 'Expires',
        );

      case 'applied':
        return _buildStatusContainer(
          color: kGreenApplied,
          icon: Icons.check_circle,
          text: 'Applied',
        );

      default:
        return Container();
    }
  }

  Widget _buildStatusContainer({
    required Color color,
    required IconData icon,
    required String text,
  }) =>
      Container(
        transform: Matrix4.translationValues(16, 0, 0),
        height: 20,
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: SizeConfig.blockSizeHorizontal! * 3,
              color: kWhite,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: kPoppinsSemibold.copyWith(
                color: kWhite,
                fontSize: SizeConfig.blockSizeHorizontal! * 2.3,
              ),
            ),
          ],
        ),
      );
}

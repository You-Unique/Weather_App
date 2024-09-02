import 'package:flutter/material.dart';
import 'package:newapp/screens/widgets/extensions.dart';

class SearchScreenViewModel extends StatefulWidget {
  const SearchScreenViewModel({super.key});

  @override
  State<SearchScreenViewModel> createState() => _SearchScreenViewModelState();
}

class _SearchScreenViewModelState extends State<SearchScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 180,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                color: Colors.blue[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '29ºC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // 10.vSpace,
                Image.asset(
                  'rain'.toPNG(),
                  width: 60,
                ),
                // 10.vSpace,
                const Text(
                  'Mon',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          20.hSpace,
          Container(
            height: 180,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                color: Colors.blue[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '29ºC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // 10.vSpace,
                Image.asset(
                  'rain'.toPNG(),
                  width: 60,
                ),
                // 10.vSpace,
                const Text(
                  'Mon',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          20.hSpace,
          Container(
            height: 180,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                color: Colors.blue[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '29ºC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // 10.vSpace,
                Image.asset(
                  'rain'.toPNG(),
                  width: 60,
                ),
                // 10.vSpace,
                const Text(
                  'Mon',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          20.hSpace,
          Container(
            height: 180,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                color: Colors.blue[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '29ºC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // 10.vSpace,
                Image.asset(
                  'rain'.toPNG(),
                  width: 60,
                ),
                // 10.vSpace,
                const Text(
                  'Mon',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          20.hSpace,
          Container(
            height: 180,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                color: Colors.blue[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '29ºC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // 10.vSpace,
                Image.asset(
                  'rain'.toPNG(),
                  width: 60,
                ),
                // 10.vSpace,
                const Text(
                  'Mon',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          20.hSpace,
          Container(
            height: 180,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                color: Colors.blue[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '29ºC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // 10.vSpace,
                Image.asset(
                  'rain'.toPNG(),
                  width: 60,
                ),
                // 10.vSpace,
                const Text(
                  'Mon',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

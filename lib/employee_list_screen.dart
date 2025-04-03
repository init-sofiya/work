import 'package:flutter/material.dart';
import 'package:work/widgets/employee_detail_sheet.dart';

import 'models/employee.dart';
import 'widgets/employee_card.dart';
import 'widgets/stat_card.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchTerm = '';
  int? _expandedEmployeeId;
  final List<Employee> _employees = Employee.sampleData;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Employee> get _filteredEmployees {
    final searchLower = _searchTerm.toLowerCase();
    return _employees.where((employee) {
      final matchesSearch =
          employee.name.toLowerCase().contains(searchLower) ||
          employee.role.toLowerCase().contains(searchLower) ||
          employee.department.toLowerCase().contains(searchLower);

      if (_tabController.index == 0) return matchesSearch;
      if (_tabController.index == 1)
        return matchesSearch && employee.status == 'Active';
      if (_tabController.index == 2)
        return matchesSearch && employee.status == 'Remote';
      if (_tabController.index == 3)
        return matchesSearch && employee.status == 'On Leave';

      return matchesSearch;
    }).toList();
  }

  void _toggleExpand(int id) {
    setState(() {
      _expandedEmployeeId = _expandedEmployeeId == id ? null : id;
    });
  }

  // void _showEmployeeDetails(Employee employee) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder:
  //         (context) => DraggableScrollableSheet(
  //           initialChildSize: 0.9,
  //           maxChildSize: 0.9,
  //           minChildSize: 0.5,
  //           expand: false,
  //           builder: (context, scrollController) {
  //             return EmployeeDetailSheet(
  //               employee: employee,
  //               scrollController: scrollController,
  //             );
  //           },
  //         ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final stats = {
      'total': _employees.length,
      'active': _employees.where((e) => e.status == 'Active').length,
      'remote': _employees.where((e) => e.status == 'Remote').length,
      'onLeave': _employees.where((e) => e.status == 'On Leave').length,
    };

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IT Team',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Manage your team members',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red.shade100, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Center(
                        child: Text(
                          'AD',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Stats Cards
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.people,
                      title: 'Total Team',
                      value: stats['total'].toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      icon: Icons.trending_up,
                      title: 'Active Now',
                      value: stats['active'].toString(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchTerm = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search employees...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Tabs
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Active'),
                    Tab(text: 'Remote'),
                    Tab(text: 'Leave'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Employee List
              Expanded(
                child:
                    _filteredEmployees.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_off,
                                size: 48,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No employees found',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try adjusting your search or filters',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: _filteredEmployees.length,
                          itemBuilder: (context, index) {
                            final employee = _filteredEmployees[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: EmployeeCard(
                                employee: employee,
                                isExpanded: _expandedEmployeeId == employee.id,
                                onToggleExpand:
                                    () => _toggleExpand(employee.id),
                                onShowDetails: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => EmployeeDetailSheet(
                                            employee: employee,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

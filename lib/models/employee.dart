class Employee {
  final int id;
  final String name;
  final String role;
  final String department;
  final String email;
  final String phone;
  final String hireDate;
  final String status;
  final String location;
  final String avatar;
  final List<String> skills;
  final List<String> projects;
  final int performance;
  final int teamSize;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.department,
    required this.email,
    required this.phone,
    required this.hireDate,
    required this.status,
    required this.location,
    required this.avatar,
    required this.skills,
    required this.projects,
    required this.performance,
    required this.teamSize,
  });

  static List<Employee> get sampleData => [
    Employee(
      id: 1,
      name: "Alex Johnson",
      role: "Senior Frontend Developer",
      department: "Engineering",
      email: "alex.johnson@company.com",
      phone: "+1 (555) 123-4567",
      hireDate: "2020-03-15",
      status: "Active",
      location: "San Francisco, CA",
      avatar: "https://i.pravatar.cc/150?img=1",
      skills: ["React", "TypeScript", "Tailwind CSS"],
      projects: ["Dashboard Redesign", "Mobile App"],
      performance: 92,
      teamSize: 4,
    ),
    Employee(
      id: 2,
      name: "Samantha Lee",
      role: "DevOps Engineer",
      department: "Infrastructure",
      email: "samantha.lee@company.com",
      phone: "+1 (555) 234-5678",
      hireDate: "2021-06-22",
      status: "On Leave",
      location: "Austin, TX",
      avatar: "https://i.pravatar.cc/150?img=5",
      skills: ["AWS", "Docker", "Kubernetes"],
      projects: ["Cloud Migration", "CI/CD Pipeline"],
      performance: 88,
      teamSize: 3,
    ),
    Employee(
      id: 3,
      name: "Michael Chen",
      role: "Backend Developer",
      department: "Engineering",
      email: "michael.chen@company.com",
      phone: "+1 (555) 345-6789",
      hireDate: "2019-11-05",
      status: "Active",
      location: "New York, NY",
      avatar: "https://i.pravatar.cc/150?img=3",
      skills: ["Node.js", "Python", "MongoDB"],
      projects: ["API Gateway", "Authentication Service"],
      performance: 95,
      teamSize: 5,
    ),
    Employee(
      id: 4,
      name: "Priya Patel",
      role: "UX/UI Designer",
      department: "Design",
      email: "priya.patel@company.com",
      phone: "+1 (555) 456-7890",
      hireDate: "2022-01-10",
      status: "Active",
      location: "Seattle, WA",
      avatar: "https://i.pravatar.cc/150?img=6",
      skills: ["Figma", "Adobe XD", "Sketch"],
      projects: ["Mobile App Redesign", "Design System"],
      performance: 90,
      teamSize: 2,
    ),
    Employee(
      id: 5,
      name: "David Wilson",
      role: "Data Scientist",
      department: "Data",
      email: "david.wilson@company.com",
      phone: "+1 (555) 567-8901",
      hireDate: "2021-09-30",
      status: "Remote",
      location: "Chicago, IL",
      avatar: "https://i.pravatar.cc/150?img=7",
      skills: ["Python", "TensorFlow", "SQL"],
      projects: ["Recommendation Engine", "Data Pipeline"],
      performance: 87,
      teamSize: 3,
    ),
    Employee(
      id: 6,
      name: "Emma Rodriguez",
      role: "QA Engineer",
      department: "Quality Assurance",
      email: "emma.rodriguez@company.com",
      phone: "+1 (555) 678-9012",
      hireDate: "2020-07-18",
      status: "Active",
      location: "Boston, MA",
      avatar: "https://i.pravatar.cc/150?img=9",
      skills: ["Selenium", "Jest", "Cypress"],
      projects: ["Automated Testing", "Regression Suite"],
      performance: 89,
      teamSize: 4,
    ),
  ];
}

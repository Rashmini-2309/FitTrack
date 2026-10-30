import 'package:flutter/material.dart';
void main() {
  runApp(const FitTrackApp());
}

class FitTrackApp extends StatelessWidget {
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitTrack',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF5F7F5),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PersonalDetailsPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username and password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Icon(
                Icons.fitness_center,
                size: 80,
                color: Colors.green,
              ),
              const SizedBox(height: 15),
              const Text(
                'FitTrack',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your personal fitness journey',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 35),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() =>
      _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  String gender = 'Male';

  void continueNext() {
    if (heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all details'),
        ),
      );
      return;
    }

    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);
    int? age = int.tryParse(ageController.text);

    if (height == null || weight == null || age == null || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid details'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HealthAssessmentPage(
          height: height,
          weight: weight,
          age: age,
          gender: gender,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.person_outline,
              size: 70,
              color: Colors.green,
            ),
            const SizedBox(height: 15),
            const Text(
              'Tell us about yourself',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                prefixIcon: const Icon(Icons.height),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                prefixIcon: const Icon(Icons.monitor_weight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                prefixIcon: const Icon(Icons.cake),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: gender,
              decoration: InputDecoration(
                labelText: 'Gender',
                prefixIcon: const Icon(Icons.wc),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: continueNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthAssessmentPage extends StatelessWidget {
  final double height;
  final double weight;
  final int age;
  final String gender;

  const HealthAssessmentPage({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  double get bmi {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String get status {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  String get weightRange {
    double heightInMeters = height / 100;
    double minWeight =
        18.5 * heightInMeters * heightInMeters;
    double maxWeight =
        24.9 * heightInMeters * heightInMeters;

    return '${minWeight.toStringAsFixed(1)} kg - ${maxWeight.toStringAsFixed(1)} kg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Assessment'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.health_and_safety,
              size: 70,
              color: Colors.green,
            ),
            const SizedBox(height: 15),
            const Text(
              'Your Health Assessment',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Text(
                      'Your BMI',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    const Text(
                      'Reference Weight Range',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weightRange,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardPage(
                        bmi: bmi,
                        healthStatus: status,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Go to Dashboard',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  final double bmi;
  final String healthStatus;

  const DashboardPage({
    super.key,
    required this.bmi,
    required this.healthStatus,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int completedDays = 0;
  String selectedWorkout = 'Not Started';

  int waterConsumed = 0;
  final int waterGoal = 2000;
  void addWater(int amount) {
    setState(() {
      waterConsumed += amount;

      if (waterConsumed > waterGoal) {
        waterConsumed = waterGoal;
      }
    });
  }

  void showWaterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Water',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(
                  Icons.local_drink,
                  color: Colors.blue,
                ),
                title: const Text('250 ml'),
                onTap: () {
                  addWater(250);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.local_drink,
                  color: Colors.blue,
                ),
                title: const Text('500 ml'),
                onTap: () {
                  addWater(500);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.local_drink,
                  color: Colors.blue,
                ),
                title: const Text('750 ml'),
                onTap: () {
                  addWater(750);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.local_drink,
                  color: Colors.blue,
                ),
                title: const Text('1000 ml'),
                onTap: () {
                  addWater(1000);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void openWorkout(String workout) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(
          activity: workout,
          completedDays: completedDays,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        completedDays = result['completedDays'];
        selectedWorkout = result['activity'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = completedDays / 30;
    double waterProgress = waterConsumed / waterGoal;

    List<Map<String, dynamic>> workouts = [
      {
        'name': 'Yoga',
        'icon': Icons.self_improvement,
      },
      {
        'name': 'Jogging',
        'icon': Icons.directions_run,
      },
      {
        'name': 'Sports',
        'icon': Icons.sports_basketball,
      },
      {
        'name': 'Walking',
        'icon': Icons.directions_walk,
      },
      {
        'name': 'Strength Training',
        'icon': Icons.fitness_center,
      },
      {
        'name': 'Cycling',
        'icon': Icons.directions_bike,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FitTrack'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to FitTrack 👋',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Let’s work on your fitness today!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Health Status',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.healthStatus,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'BMI: ${widget.bmi.toStringAsFixed(1)}',
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.show_chart,
                          color: Colors.green,
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'My Progress',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '30-Day Challenge',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '$completedDays',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${30 - completedDays}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                const Text(
                                  'Remaining',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      selectedWorkout == 'Not Started'
                          ? 'Choose a workout to start your challenge'
                          : 'Current Workout: $selectedWorkout',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.water_drop,
                          color: Colors.blue,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'Water Intake',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: showWaterOptions,
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '$waterConsumed ml / $waterGoal ml',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: waterProgress,
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(waterProgress * 100).toInt()}% of daily goal',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Choose Your Workout',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount: workouts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    openWorkout(
                      workouts[index]['name'],
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          workouts[index]['icon'],
                          size: 45,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          workouts[index]['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutPage extends StatelessWidget {
  final String activity;
  final int completedDays;

  const WorkoutPage({
    super.key,
    required this.activity,
    required this.completedDays,
  });

  List<Map<String, dynamic>> getExercises() {
    if (activity == 'Yoga') {
      return [
        {
          'name': 'Cat-Cow',
          'amount': '10 reps',
          'icon': Icons.self_improvement,
        },
        {
          'name': 'Child’s Pose',
          'amount': '30 sec',
          'icon': Icons.accessibility_new,
        },
        {
          'name': 'Cobra Pose',
          'amount': '30 sec',
          'icon': Icons.accessibility,
        },
        {
          'name': 'Downward Dog',
          'amount': '30 sec',
          'icon': Icons.self_improvement,
        },
        {
          'name': 'Warrior Pose',
          'amount': '30 sec',
          'icon': Icons.accessibility_new,
        },
      ];
    }

    if (activity == 'Jogging') {
      return [
        {
          'name': 'Warm-up Walk',
          'amount': '5 min',
          'icon': Icons.directions_walk,
        },
        {
          'name': 'Light Jog',
          'amount': '10 min',
          'icon': Icons.directions_run,
        },
        {
          'name': 'Fast Jog',
          'amount': '5 min',
          'icon': Icons.directions_run,
        },
        {
          'name': 'Cool-down',
          'amount': '5 min',
          'icon': Icons.self_improvement,
        },
      ];
    }

    if (activity == 'Sports') {
      return [
        {
          'name': 'Basketball',
          'amount': '20 min',
          'icon': Icons.sports_basketball,
        },
        {
          'name': 'Football',
          'amount': '20 min',
          'icon': Icons.sports_soccer,
        },
        {
          'name': 'Badminton',
          'amount': '20 min',
          'icon': Icons.sports_tennis,
        },
        {
          'name': 'Volleyball',
          'amount': '20 min',
          'icon': Icons.sports_volleyball,
        },
      ];
    }

    if (activity == 'Walking') {
      return [
        {
          'name': 'Warm-up Walk',
          'amount': '5 min',
          'icon': Icons.directions_walk,
        },
        {
          'name': 'Brisk Walk',
          'amount': '20 min',
          'icon': Icons.directions_walk,
        },
        {
          'name': 'Normal Walk',
          'amount': '10 min',
          'icon': Icons.directions_walk,
        },
        {
          'name': 'Cool-down Walk',
          'amount': '5 min',
          'icon': Icons.self_improvement,
        },
      ];
    }

    if (activity == 'Strength Training') {
      return [
        {
          'name': 'Squats',
          'amount': '30 reps',
          'icon': Icons.fitness_center,
        },
        {
          'name': 'Push-ups',
          'amount': '15 reps',
          'icon': Icons.fitness_center,
        },
        {
          'name': 'Lunges',
          'amount': '20 reps',
          'icon': Icons.directions_run,
        },
        {
          'name': 'Plank',
          'amount': '30 sec',
          'icon': Icons.accessibility_new,
        },
        {
          'name': 'Glute Bridge',
          'amount': '20 reps',
          'icon': Icons.fitness_center,
        },
      ];
    }

    return [
      {
        'name': 'Warm-up Cycling',
        'amount': '5 min',
        'icon': Icons.directions_bike,
      },
      {
        'name': 'Moderate Cycling',
        'amount': '15 min',
        'icon': Icons.directions_bike,
      },
      {
        'name': 'Fast Cycling',
        'amount': '10 min',
        'icon': Icons.directions_bike,
      },
      {
        'name': 'Cool-down Cycling',
        'amount': '5 min',
        'icon': Icons.self_improvement,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final exercises = getExercises();

    return Scaffold(
      appBar: AppBar(
        title: Text(activity),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              '$activity Workout',
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Complete these exercises every day.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ...exercises.map(
              (exercise) {
                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.all(12),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Colors.green.shade100,
                      child: Icon(
                        exercise['icon'],
                        color: Colors.green,
                      ),
                    ),
                    title: Text(
                      exercise['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      exercise['amount'],
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final result =
                      await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChallengePage(
                        activity: activity,
                        exercises: exercises,
                        completedDays: completedDays,
                      ),
                    ),
                  );

                  if (result != null) {
                    Navigator.pop(
                      context,
                      result,
                    );
                  }
                },
                icon: const Icon(
                  Icons.calendar_month,
                ),
                label: const Text(
                  'Start 30-Day Challenge',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengePage extends StatefulWidget {
  final String activity;
  final List<Map<String, dynamic>> exercises;
  final int completedDays;

  const ChallengePage({
    super.key,
    required this.activity,
    required this.exercises,
    required this.completedDays,
  });

  @override
  State<ChallengePage> createState() =>
      _ChallengePageState();
}

class _ChallengePageState
    extends State<ChallengePage> {
  late int currentDay;
  late List<bool> completedDays;
  late List<bool> completedExercises;

  @override
  void initState() {
    super.initState();

    currentDay = widget.completedDays + 1;

    if (currentDay > 30) {
      currentDay = 30;
    }

    completedDays = List.filled(30, false);

    for (int i = 0;
        i < widget.completedDays;
        i++) {
      completedDays[i] = true;
    }

    completedExercises =
        List.filled(
      widget.exercises.length,
      false,
    );
  }

  double get progress {
    int completed = 0;

    for (bool day in completedDays) {
      if (day) {
        completed++;
      }
    }

    return completed / 30;
  }

  void completeDay() {
    bool allExercisesCompleted = true;

    for (bool exercise in completedExercises) {
      if (!exercise) {
        allExercisesCompleted = false;
      }
    }

    if (!allExercisesCompleted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Complete all exercises before finishing the day',
          ),
        ),
      );
      return;
    }

    setState(() {
      completedDays[currentDay - 1] = true;
    });

    if (currentDay == 30) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Challenge Completed 🎉',
            ),
            content: Text(
              'Congratulations! You completed the 30-Day ${widget.activity} Challenge.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(
                    context,
                    {
                      'completedDays': 30,
                      'activity':
                          widget.activity,
                    },
                  );
                },
                child: const Text('Finish'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        currentDay++;
        completedExercises =
            List.filled(
          widget.exercises.length,
          false,
        );
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Day ${currentDay - 1} completed! 🎉',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '30-Day ${widget.activity} Challenge',
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      '30-Day ${widget.activity} Challenge',
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Day $currentDay of 30',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 12,
                      borderRadius:
                          BorderRadius.circular(
                        10,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(progress * 100).toInt()}% Completed',
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Today\'s Exercises',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...List.generate(
              widget.exercises.length,
              (index) {
                final exercise =
                    widget.exercises[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),
                  elevation: 2,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      18,
                    ),
                  ),
                  child: CheckboxListTile(
                    value:
                        completedExercises[
                            index],
                    onChanged: (value) {
                      setState(() {
                        completedExercises[
                                index] =
                            value!;
                      });
                    },
                    activeColor:
                        Colors.green,
                    secondary: CircleAvatar(
                      backgroundColor:
                          Colors.green.shade100,
                      child: Icon(
                        exercise['icon'],
                        color:
                            Colors.green,
                      ),
                    ),
                    title: Text(
                      exercise['name'],
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      exercise['amount'],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: completeDay,
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green,
                  foregroundColor:
                      Colors.white,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      16,
                    ),
                  ),
                ),
                child: Text(
                  currentDay == 30
                      ? 'Complete Challenge'
                      : 'Complete Day $currentDay',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Challenge Progress',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount: 30,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder:
                  (context, index) {
                bool completed =
                    completedDays[index];
                bool today =
                    index + 1 == currentDay;

                return Container(
                  decoration:
                      BoxDecoration(
                    color: completed
                        ? Colors.green
                        : today
                            ? Colors.green.shade100
                            : Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),
                    border: Border.all(
                      color: completed ||
                              today
                          ? Colors.green
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: completed
                        ? const Icon(
                            Icons.check,
                            color:
                                Colors.white,
                          )
                        : Text(
                            '${index + 1}',
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
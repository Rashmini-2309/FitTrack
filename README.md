FitTrack -- Fitness and Health Tracking Application
FitTrack is a Flutter-based mobile application designed to help users
monitor basic health information and maintain healthy fitness habits. It
brings BMI calculation, daily water intake tracking, water reminders,
workout routines, and a 30-day fitness challenge together in one
application.
Features
- Login screen: Provides username and password fields to enter the
  application.
- Personal details: Collects height, weight, age, and gender.
- BMI calculation: Calculates Body Mass Index using the entered
  height and weight.
- Health category: Displays the BMI category: Underweight, Normal,
  Overweight, or Obesity.
- Reference weight range: Displays a reference healthy weight
  range based on the entered height.
- Dashboard: Shows BMI, health status, water intake, selected
  workout, and challenge progress.
- Water intake tracking: Tracks water consumption against a daily
  target of 2000 ml. Users can add 250 ml, 500 ml, 750 ml, or 1000
  ml.
- Water reminders: Uses local notifications to provide water
  reminders.
- Workout categories: Offers Yoga, Jogging, Sports, Walking,
  Strength Training, and Cycling.
- 30-day fitness challenge: Lets users mark exercises as completed
  and track their challenge progress.
Workout Categories
  Category                            Example exercises
  Yoga                                Cat-Cow, Child's Pose, Cobra Pose,
Downward Dog, Warrior Pose

  Jogging                             Warm-up Walk, Light Jog, Fast Jog,
Cool-down

  Sports                              Basketball, Football, Badminton,
Volleyball

  Walking                             Warm-up Walk, Brisk Walk, Normal
Walk, Cool-down

  Strength Training                   Squats, Push-ups, Lunges, Plank,
Glute Bridge
Cycling                             Warm-up Cycling, Moderate Cycling,
Fast Cycling, Cool-down Cycling
Technologies Used
- Flutter -- UI framework
- Dart -- Programming language
- Material Design widgets -- Interface components such as text
  fields, buttons, cards, icons, and progress indicators
- StatefulWidget and setState() -- Managing changing interface
  values and progress
- Flutter Local Notifications -- Local water reminder
  notifications
Application Flow
1. Open the application and enter the username and password.
2. Enter personal details such as height, weight, age, and gender.
3. View the BMI result, health category, and reference weight range.
4. Use the dashboard to view health information and fitness progress.
5. Add water intake and manage water reminders.
6. Select a workout category and view its exercises.
7. Start the 30-day challenge and mark exercises as completed.

   
Project Structure
The main application screens and their logic are organized in the Dart
source file:
lib/
└── main.dart
The main file contains the application initialization and the Login,
Personal Details, Health Assessment, Dashboard, Workout, and Challenge
screens, along with the related application logic.
FitTrack -- Fitness and Health Tracking Application

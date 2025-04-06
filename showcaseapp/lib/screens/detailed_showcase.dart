import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/component_details.dart';
import '../widgets/eduease_logo.dart';

class DetailedShowcaseScreen extends StatelessWidget {
  const DetailedShowcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduEase UI Components'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo Component
            ComponentDetails(
              componentName: 'EduEase Logo',
              description:
                  'The main application logo that combines a book icon with the EduEase text.',
              usages: ['Application header', 'Login screen', 'About page'],
              componentDemo: const EduEaseLogo(size: 100),
            ),

            // Navigation Tabs
            ComponentDetails(
              componentName: 'Navigation Tabs',
              description:
                  'Horizontal tab navigation for switching between main app sections.',
              usages: [
                'Main navigation between Tasks, Timer, and Habits screens',
              ],
              componentDemo: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.lightAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    _buildDemoTab('Tasks', true),
                    _buildDemoTab('Timer', false),
                    _buildDemoTab('Habits', false),
                  ],
                ),
              ),
            ),

            // Task Item
            ComponentDetails(
              componentName: 'Task Item',
              description:
                  'Displays a task with its priority, due date, and completion status.',
              usages: [
                'Tasks screen for displaying individual tasks',
                'Today\'s tasks summary widget',
              ],
              componentDemo: _buildDemoTaskItem(
                'Complete Assignment',
                'Due: Tomorrow, 12:00',
                false,
                AppColors.highPriority,
                'High',
              ),
            ),

            // Timer Circle
            ComponentDetails(
              componentName: 'Timer Circle',
              description:
                  'Circular timer display showing the remaining time and current status.',
              usages: ['Pomodoro timer screen', 'Quick timer widget'],
              componentDemo: SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightAccent,
                        border: Border.all(color: AppColors.accent, width: 4),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 134,
                        height: 134,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                          border: Border.all(color: AppColors.accent, width: 2),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "25:00",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "NOT STARTED",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Timer Controls
            ComponentDetails(
              componentName: 'Timer Controls',
              description:
                  'Control buttons for the Pomodoro timer functionality.',
              usages: ['Timer screen', 'Quick timer widget'],
              componentDemo: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reset button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.header,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '⟲',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Play button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            // Setting Slider
            ComponentDetails(
              componentName: 'Setting Slider',
              description:
                  'Slider control for adjusting timer duration settings.',
              usages: ['Timer settings panel', 'Preferences screen'],
              componentDemo: _buildDemoSettingSlider('Work:', 25, '25 min'),
            ),

            // Habit Tracker
            ComponentDetails(
              componentName: 'Habit Tracker',
              description:
                  'Weekly habit tracking visualization with completion status indicators.',
              usages: ['Habits screen', 'Dashboard widgets'],
              componentDemo: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'M',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'W',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        'F',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        'S/S',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDemoHabitCircle(true),
                      _buildDemoHabitCircle(true),
                      _buildDemoHabitCircle(false),
                      _buildDemoHabitCircle(null),
                      _buildDemoHabitCircle(null),
                      _buildDemoHabitCircle(null),
                    ],
                  ),
                ],
              ),
            ),

            // Progress Bar
            ComponentDetails(
              componentName: 'Progress Bar',
              description:
                  'Visual indicator of progress or completion percentage.',
              usages: [
                'Weekly progress summary',
                'Task completion statistics',
                'Study session progress',
              ],
              componentDemo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '7 of 11 habits completed',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.header,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width:
                              (7 / 11) *
                              (MediaQuery.of(context).size.width - 64),
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppColors.lowPriority,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Floating Action Button
            ComponentDetails(
              componentName: 'Floating Action Button',
              description:
                  'A circular button for primary actions such as adding new items.',
              usages: [
                'Tasks screen for adding new tasks',
                'Habits screen for adding new habits',
              ],
              componentDemo: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: const Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),

            // Input Field
            ComponentDetails(
              componentName: 'Input Field',
              description: 'Text input field for user data entry.',
              usages: [
                'Task creation',
                'Habit creation',
                'Search functionality',
              ],
              componentDemo: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFA8997F), width: 1),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Add a new task...',
                    hintStyle: TextStyle(
                      color: Color(0xFFA8997F),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14, color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoTab(String title, bool isSelected) {
    return Expanded(
      child: Container(
        color: isSelected ? AppColors.accent : AppColors.lightAccent,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.primary : AppColors.secondaryText,
          ),
        ),
      ),
    );
  }

  Widget _buildDemoTaskItem(
    String title,
    String subtitle,
    bool isCompleted,
    Color priorityColor,
    String priorityText,
  ) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.lightAccent : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.accent, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),

          // Checkbox
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? AppColors.accent : Colors.white,
              border: Border.all(color: AppColors.secondaryText, width: 2),
            ),
            child:
                isCompleted
                    ? const Icon(
                      Icons.check,
                      size: 14,
                      color: AppColors.primary,
                    )
                    : null,
          ),

          const SizedBox(width: 10),

          // Priority indicator
          Container(
            width: 4,
            height: 30,
            decoration: BoxDecoration(
              color: priorityColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(width: 10),

          // Task details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isCompleted ? FontWeight.normal : FontWeight.bold,
                    color:
                        isCompleted
                            ? AppColors.secondaryText
                            : AppColors.primary,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        isCompleted
                            ? const Color(0xFFA8997F)
                            : AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),

          // Priority tag
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: priorityColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              priorityText,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),

          const SizedBox(width: 15),
        ],
      ),
    );
  }

  Widget _buildDemoSettingSlider(String label, int value, String displayValue) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, color: AppColors.primary),
          ),
        ),

        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.header,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 120,
                  top: -8,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          width: 50,
          child: Text(
            displayValue,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _buildDemoHabitCircle(bool? status) {
    // Color and content based on status
    Color circleColor;
    Widget? circleContent;

    if (status == null) {
      circleColor = AppColors.lightAccent;
      circleContent = null;
    } else if (status) {
      circleColor = AppColors.lowPriority;
      circleContent = const Text(
        '✓',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    } else {
      circleColor = AppColors.highPriority;
      circleContent = const Text(
        '✗',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
        border:
            status == null
                ? Border.all(color: const Color(0xFFA8997F), width: 2)
                : null,
      ),
      child: Center(child: circleContent),
    );
  }
}

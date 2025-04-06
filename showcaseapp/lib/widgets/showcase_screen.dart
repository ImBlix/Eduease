import 'package:flutter/material.dart';
import 'dart:async';
import '../constants/colors.dart';
import 'eduease_logo.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({Key? key}) : super(key: key);

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  // For Timer
  int _currentSeconds = 25 * 60;
  bool _isRunning = false;
  Timer? _timer;
  String _timerStatus = "NOT STARTED";

  // For Tasks
  final TextEditingController _taskController = TextEditingController();
  int _selectedTaskIndex = -1;

  // For Habits
  final List<bool?> _habitStatus = [true, true, false, null, null, null];

  // For Navigation
  int _selectedTabIndex = 0;

  @override
  void dispose() {
    _timer?.cancel();
    _taskController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = true;
      _timerStatus = "WORKING";
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          _pauseTimer();
          _currentSeconds = 25 * 60;
        }
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _timerStatus = "PAUSED";
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _currentSeconds = 25 * 60;
      _timerStatus = "NOT STARTED";
    });
  }

  String _formatTime() {
    int minutes = _currentSeconds ~/ 60;
    int seconds = _currentSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _toggleHabitStatus(int index) {
    setState(() {
      if (_habitStatus[index] == null) {
        _habitStatus[index] = true;
      } else if (_habitStatus[index] == true) {
        _habitStatus[index] = false;
      } else {
        _habitStatus[index] = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  'EduEase Component Showcase',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 20),

                // Logo Section
                _buildSectionTitle('Logo'),
                const Center(child: EduEaseLogo(size: 100)),

                const SizedBox(height: 20),

                // Navigation Section
                _buildSectionTitle('Navigation Tabs'),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.lightAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      _buildTab(0, 'Tasks'),
                      _buildTab(1, 'Timer'),
                      _buildTab(2, 'Habits'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Bottom Navigation Section
                _buildSectionTitle('Bottom Navigation'),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.header,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavIcon(Icons.calendar_today),
                      _buildNavIcon(Icons.add),
                      _buildNavIcon(Icons.person),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Cards Section
                _buildSectionTitle('Cards'),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Title Card',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.accent),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Content Card',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Buttons Section
                _buildSectionTitle('Buttons'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Play/Pause button
                    GestureDetector(
                      onTap: _isRunning ? _pauseTimer : _startTimer,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isRunning ? Icons.pause : Icons.play_arrow,
                          color: AppColors.primary,
                          size: 30,
                        ),
                      ),
                    ),

                    // Reset button
                    GestureDetector(
                      onTap: _resetTimer,
                      child: Container(
                        width: 50,
                        height: 50,
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
                    ),

                    // Regular button
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    // Floating action button
                    Container(
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
                  ],
                ),

                const SizedBox(height: 20),

                // Input Fields Section
                _buildSectionTitle('Input Fields'),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFFA8997F),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Add a new task...',
                      hintStyle: TextStyle(
                        color: Color(0xFFA8997F),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Sliders Section
                _buildSectionTitle('Sliders'),
                _buildSettingSlider('Work:', 25, '25 min'),
                const SizedBox(height: 5),
                _buildSettingSlider('Short break:', 5, '5 min'),
                const SizedBox(height: 5),
                _buildSettingSlider('Long break:', 15, '15 min'),

                const SizedBox(height: 20),

                // Checkboxes & Task Items
                _buildSectionTitle('Task Items'),
                _buildTaskItem(
                  'High Priority Task',
                  'Due: Today, 23:59',
                  false,
                  AppColors.highPriority,
                  'High',
                  0,
                ),
                const SizedBox(height: 5),
                _buildTaskItem(
                  'Medium Priority Task',
                  'Due: Tomorrow, 10:00',
                  false,
                  AppColors.mediumPriority,
                  'Medium',
                  1,
                ),
                const SizedBox(height: 5),
                _buildTaskItem(
                  'Low Priority Task',
                  'Due: Friday, 17:00',
                  false,
                  AppColors.lowPriority,
                  'Low',
                  2,
                ),
                const SizedBox(height: 5),
                _buildTaskItem(
                  'Completed Task',
                  'Completed: Today, 11:23',
                  true,
                  AppColors.completedTask,
                  'Done',
                  3,
                ),

                const SizedBox(height: 20),

                // Timer Circle
                _buildSectionTitle('Timer Circle'),
                Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightAccent,
                      border: Border.all(color: AppColors.accent, width: 4),
                    ),
                    child: Center(
                      child: Container(
                        width: 164,
                        height: 164,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                          border: Border.all(color: AppColors.accent, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _formatTime(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _timerStatus,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Habit Trackers
                _buildSectionTitle('Habit Trackers'),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'M',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'W',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        'F',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        'S/S',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.accent, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Habit Example',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Daily - 7 day streak',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          6,
                          (index) => GestureDetector(
                            onTap: () => _toggleHabitStatus(index),
                            child: _buildHabitCircle(_habitStatus[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Progress Bar
                _buildSectionTitle('Progress Bar'),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Weekly Progress',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '7 of 11 habits completed',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                              width: MediaQuery.of(context).size.width * 0.5,
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

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Container(
          width: 100,
          height: 2,
          color: AppColors.accent,
          margin: const EdgeInsets.only(bottom: 10),
        ),
      ],
    );
  }

  Widget _buildTab(int index, String title) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
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
      ),
    );
  }

  Widget _buildNavIcon(IconData icon) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.lightAccent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: AppColors.primary),
    );
  }

  Widget _buildSettingSlider(String label, int value, String displayValue) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, color: AppColors.primary),
          ),
        ),

        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.header,
              inactiveTrackColor: AppColors.header,
              trackHeight: 8,
              thumbColor: AppColors.accent,
              overlayColor: AppColors.accent.withOpacity(0.2),
            ),
            child: Slider(
              value: value.toDouble(),
              min: 1,
              max: 60,
              onChanged: (double newValue) {
                // Just for demonstration
              },
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

  Widget _buildTaskItem(
    String title,
    String subtitle,
    bool isCompleted,
    Color priorityColor,
    String priorityText,
    int index,
  ) {
    return GestureDetector(
      onTap: () => setState(() => _selectedTaskIndex = index),
      child: Container(
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
            GestureDetector(
              onTap: () {},
              child: Container(
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
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
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
      ),
    );
  }

  Widget _buildHabitCircle(bool? status) {
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

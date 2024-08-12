import 'package:flutter/material.dart';

class Page8 extends StatefulWidget {
  @override
  _Page8State createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  bool _isSidePanelOpen = false;
  int _selectedAnswer = -1; // Variable to keep track of selected answer
  int _currentQuestionIndex = 0; // Index of the current question
  bool _isCorrect = false; // Variable to check if the selected answer is correct

  // List of questions and answers
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the main purpose of photosynthesis in plants, algae, and certain bacteria?',
      'options': [
        'To convert light energy into chemical energy (glucose) and release oxygen.',
        'To absorb carbon dioxide and release nitrogen.',
        'To produce water and store it for later use.',
        'To generate energy through respiration.'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Which pigment is primarily responsible for capturing light energy in photosynthesis?',
      'options': [
        'Chlorophyll',
        'Carotenoids',
        'Xanthophylls',
        'Anthocyanins'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'In which part of the plant does photosynthesis mainly occur?',
      'options': [
        'Leaves',
        'Roots',
        'Stems',
        'Flowers'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'What are the two main stages of photosynthesis?',
      'options': [
        'Light-dependent reactions and Calvin cycle',
        'Glycolysis and Krebs cycle',
        'Electron transport chain and Fermentation',
        'Citric acid cycle and Photosystem'
      ],
      'correctAnswer': 0,
    }
  ];

  void _toggleSidePanel() {
    setState(() {
      _isSidePanelOpen = !_isSidePanelOpen;
    });
  }

  void _checkAnswer(int index) {
    setState(() {
      _selectedAnswer = index;
      _isCorrect = _selectedAnswer == _questions[_currentQuestionIndex]['correctAnswer'];
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswer = -1; // Reset selected answer for the new question
        _isCorrect = false; // Reset correctness for the new question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Side Panel
          Positioned(
            left: _isSidePanelOpen ? 0 : -screenWidth * 0.7,
            top: 0,
            child: Container(
              width: screenWidth * 0.7,
              height: screenHeight,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  GestureDetector(
                    onTap: _toggleSidePanel,
                    child: Container(
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.07,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Side Panel',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Menu Options with Bullet Icons
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(8.0),
                      children: [
                        _buildMenuItem(Icons.circle, 'Help'),
                        _buildMenuItem(Icons.circle, 'Settings'),
                        _buildMenuItem(Icons.circle, 'Username'),
                        // Add more menu items here if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main content

          Positioned(
            left: screenWidth * -0.15,
            top: screenHeight * 0.07,
            child: Container(
              width: screenWidth * 0.57,
              height: screenHeight * 0.29,
              decoration: ShapeDecoration(
                color: Color(0xFF031640),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.15,
            top: screenHeight * -0.06,
            child: Container(
              width: screenWidth * 0.63,
              height: screenHeight * 0.33,
              decoration: ShapeDecoration(
                color: Color(0xFFFCAE3F),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.61,
            top: screenHeight * 0.1,
            child: Container(
              width: screenWidth * 0.28,
              height: screenHeight * 0.14,
              decoration: ShapeDecoration(
                color: Color(0xFFED5552),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.77,
            top: screenHeight * 0.27,
            child: Container(
              width: screenWidth * 0.09,
              height: screenHeight * 0.09,
              decoration: ShapeDecoration(
                color: Color(0xE5E4FF1A),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: screenHeight * 0.0125,
            child: GestureDetector(
              onTap: _toggleSidePanel,
              child: Container(
                width: screenWidth * 0.15,
                height: screenHeight * 0.048,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/hamburger.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.73,
            top: screenHeight * 0.014,
            child: Container(
              width: screenWidth * 0.24,
              height: screenHeight * 0.067,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/eduv.jpg"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(720),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.05,
            top: screenHeight * 0.23,
            child: Container(
              width: screenWidth * 0.91,
              height: screenHeight * 0.55,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: screenHeight * 0.01,
                    child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.54,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 3.02,
                    top: 3.74,
                    child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.54,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6.04,
                    top: 0,
                    child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.54,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.15,
            top: screenHeight * 0.26,
            child: SizedBox(
              width: screenWidth * 0.24,
              height: screenHeight * 0.03,
              child: Text(
                'Question ${_currentQuestionIndex + 1}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.16,
            top: screenHeight * 0.32,
            child: SizedBox(
              width: screenWidth * 0.71,
              height: screenHeight * 0.08,
              child: Text(
                _questions[_currentQuestionIndex]['question'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.037,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ..._buildAnswerOptions(screenWidth, screenHeight),

          if (_isCorrect)
            Positioned(
              left: screenWidth * 0.5 - 40, // Centering the button
              top: screenHeight * 0.7,
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Correct',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextQuestion,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  List<Widget> _buildAnswerOptions(double screenWidth, double screenHeight) {
    final options = _questions[_currentQuestionIndex]['options'] as List<String>;
    return List<Widget>.generate(
      options.length,
          (index) => _buildAnswerOption(
        index,
        options[index],
        screenWidth,
        screenHeight,
      ),
    );
  }

  Widget _buildAnswerOption(
      int index, String text, double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.16,
      top: screenHeight * (0.42 + index * 0.07),
      child: GestureDetector(
        onTap: () => _checkAnswer(index),
        child: Row(
          children: [
            Icon(
              _selectedAnswer == index
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.black,
            ),
            SizedBox(width: screenWidth * 0.02),
            SizedBox(
              width: screenWidth * 0.66,
              height: screenHeight * 0.05,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.035,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {},
    );
  }
}
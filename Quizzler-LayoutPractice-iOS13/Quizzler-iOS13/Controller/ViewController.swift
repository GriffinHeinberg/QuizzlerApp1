//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Updated by Griffin Heinberg on 3/23/2024
//  Enhancements:
//  1) Changed color of true and false buttons to yellow and orange
//  2) Added 3 more questions regarding St. Austine and Professor Wang at the end

import UIKit

class ViewController: UIViewController {
    
    // IB Outlet connected
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //Variable
   var quizBrain = QuizBrain()
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Get answers
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // Enhancement 1 - changed colors
        if userGotItRight {
            sender.backgroundColor = UIColor.yellow
        }else {
            sender.backgroundColor = UIColor.orange
        }
        
       quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    // Updated UI
    @objc func updateUI () {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}


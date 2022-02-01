//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    @IBAction func awswerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.6901960784, blue: 0.5254901961, alpha: 1)
            sender.layer.borderColor = #colorLiteral(red: 0.2745098039, green: 0.3921568627, blue: 0.5647058824, alpha: 1)
            sender.layer.cornerRadius = 28
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0, blue: 0.2156862745, alpha: 1)
            sender.layer.borderColor = #colorLiteral(red: 0.2745098039, green: 0.3921568627, blue: 0.5647058824, alpha: 1)
            sender.layer.cornerRadius = 28
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {
           [weak self] timer in
            
            self?.updateUI()

        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }    
}


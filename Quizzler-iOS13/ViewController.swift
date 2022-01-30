//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    
    var timer = Timer()
    
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    

    @IBAction func awswerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.6901960784, blue: 0.5254901961, alpha: 1)
            sender.layer.borderColor = #colorLiteral(red: 0.2745098039, green: 0.3921568627, blue: 0.5647058824, alpha: 1)
            sender.layer.cornerRadius = 28
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0, blue: 0.2156862745, alpha: 1)
            sender.layer.borderColor = #colorLiteral(red: 0.2745098039, green: 0.3921568627, blue: 0.5647058824, alpha: 1)
            sender.layer.cornerRadius = 28
        }
        
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {
           [weak self] timer in
            
            self?.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}


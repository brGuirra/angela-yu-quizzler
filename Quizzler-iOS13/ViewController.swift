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
    
    let quiz = [
        Question(text: "Four + Two is equal to Six", answer: "True"),
        Question(text: "Five - Three is greater than One", answer: "True"),
        Question(text: "Three + Eight is less than Ten", answer: "False")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    

    @IBAction func awswerButtonPressed(_ sender: UIButton) {
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
    }
    
}


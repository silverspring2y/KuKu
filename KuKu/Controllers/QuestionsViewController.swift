//
//  QestionsViewController.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/08/17.
//

import UIKit

class QuestionsViewController: UIViewController {

    var quizBrain: QuizBrain!
    var userAnswer: String = ""
    var showResultCalled = false
    
    //var recordsArray = [Question]()
    var recordsDict: [Question: Records] = [:]
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(K.recordsFile)

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        deleteButton.layer.cornerRadius = 10.0
        okButton.layer.cornerRadius = 10.0
        updateUI()
        loadRecords()
    }
  
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if showResultCalled == false {
            if let selectedNumber = sender.titleLabel?.text {
                //print(selectedNumber)
                if (userAnswer.count >= 2) || (userAnswer == "0") {
                } else {
                    userAnswer += selectedNumber
                    answerLabel.text = userAnswer
                }
            } else {
            }
        }
    }

    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        if showResultCalled == false {
            if (userAnswer.count == 1) {
                userAnswer = ""
                answerLabel.text = userAnswer
            } else if  (userAnswer.count == 2)  {
                userAnswer = String(userAnswer.prefix(1))
                answerLabel.text = userAnswer
            } else {
                
            }
        }
    }
    
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        if showResultCalled == false {
            let q = quizBrain.getQuestion()
            let userGotItRight = quizBrain.checkAnswer(userAnswer)
            print(quizBrain.getScore())
            
            if userGotItRight {
                self.answerImageView.image = UIImage(systemName: K.Shapes.correct)
                self.answerImageView.tintColor = .systemGreen
                self.answerImageView.alpha = 0.8
                
                if recordsDict.keys.contains(q) {
                    self.recordsDict.updateValue(Records(nA: recordsDict[q]!.numAsked+1, nW: recordsDict[q]!.numWrong), forKey: q)
                } else {
                    self.recordsDict.updateValue(Records(nA: 1, nW: 0), forKey: q)
                }
                
                
            } else {
                self.answerImageView.image = UIImage(systemName: K.Shapes.wrong)
                self.answerImageView.tintColor = .systemRed
                self.answerImageView.alpha = 0.8
                
                self.answerLabel.fadeTransition(0.5)
                self.answerLabel.text = q.correctAnswer

                self.answerLabel.textColor = UIColor(hex: K.ColorHex.red)
                
                if recordsDict.keys.contains(q) {
                    self.recordsDict.updateValue(Records(nA: recordsDict[q]!.numAsked+1, nW: recordsDict[q]!.numWrong+1), forKey: q)
                } else {
                    self.recordsDict.updateValue(Records(nA: 1, nW: 1), forKey: q)
                }
                
            }
            self.saveRecords()
    
            
            if quizBrain.questionNumber == 8 {
                Timer.scheduledTimer(timeInterval: 1.5, target:self, selector: #selector(showResult), userInfo:nil, repeats: false)
            } else {
                quizBrain.nextQuesition()
                userAnswer = ""
                Timer.scheduledTimer(timeInterval: 1.5, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
//        print("back button pressed")
        dismissUI()
    }
    
    
    @objc func updateUI() {
        resultLabel.alpha = 0
        progressBar.progress = quizBrain.getProgress()
        answerImageView.alpha = 0
        questionLabel.text = quizBrain.getQuestionText()
        answerLabel.text = userAnswer
        answerLabel.textColor = UIColor(hex: K.ColorHex.purple)
    }

    @objc func showResult() {
        answerImageView.alpha = 0
        questionLabel.text = ""
        answerLabel.text = ""
        equalLabel.text = ""
        resultLabel.alpha = 1
        resultLabel.text = String(quizBrain.getScore()) + "/9"
        showResultCalled = true
        
    }
    
    @objc func dismissUI(){
//        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Model Manipulation Methods
    func saveRecords(){
        let encoder = PropertyListEncoder()
        do {
            //let data = try encoder.encode(recordsArray)
            let data = try encoder.encode(recordsDict)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding records array. \(error)")
        }
    }
    
    func loadRecords(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                //recordsArray = try decoder.decode([Question].self, from: data)
                //print(recordsArray)
                recordsDict = try decoder.decode([Question: Records].self, from: data)
                print(recordsDict)
            } catch {
                print("Error decoding records array, \(error)")
            }
            
        }
    }
    
    
    
    
    
}

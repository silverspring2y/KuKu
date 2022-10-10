//
//  QuestionsListControllerViewController.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/08/15.
//

import UIKit

class QuestionsListViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var oneTimesButton: UIButton!
    @IBOutlet weak var twoTimesButton: UIButton!
    @IBOutlet weak var threeTimesButton: UIButton!
    @IBOutlet weak var fourTimesButton: UIButton!
    @IBOutlet weak var fiveTimesButton: UIButton!
    @IBOutlet weak var sixTimesButton: UIButton!
    @IBOutlet weak var sevenTimesButton: UIButton!
    @IBOutlet weak var eightTimesButton: UIButton!
    @IBOutlet weak var nineTimesButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        oneTimesButton.layer.shadowOpacity = 0.4
        oneTimesButton.layer.shadowRadius = 1
        oneTimesButton.layer.shadowColor = UIColor.black.cgColor
        oneTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        twoTimesButton.layer.shadowOpacity = 0.4
        twoTimesButton.layer.shadowRadius = 1
        twoTimesButton.layer.shadowColor = UIColor.black.cgColor
        twoTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        threeTimesButton.layer.shadowOpacity = 0.4
        threeTimesButton.layer.shadowRadius = 1
        threeTimesButton.layer.shadowColor = UIColor.black.cgColor
        threeTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        fourTimesButton.layer.shadowOpacity = 0.4
        fourTimesButton.layer.shadowRadius = 1
        fourTimesButton.layer.shadowColor = UIColor.black.cgColor
        fourTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        fiveTimesButton.layer.shadowOpacity = 0.4
        fiveTimesButton.layer.shadowRadius = 1
        fiveTimesButton.layer.shadowColor = UIColor.black.cgColor
        fiveTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        sixTimesButton.layer.shadowOpacity = 0.4
        sixTimesButton.layer.shadowRadius = 1
        sixTimesButton.layer.shadowColor = UIColor.black.cgColor
        sixTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        sevenTimesButton.layer.shadowOpacity = 0.4
        sevenTimesButton.layer.shadowRadius = 1
        sevenTimesButton.layer.shadowColor = UIColor.black.cgColor
        sevenTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        eightTimesButton.layer.shadowOpacity = 0.4
        eightTimesButton.layer.shadowRadius = 1
        eightTimesButton.layer.shadowColor = UIColor.black.cgColor
        eightTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        nineTimesButton.layer.shadowOpacity = 0.4
        nineTimesButton.layer.shadowRadius = 1
        nineTimesButton.layer.shadowColor = UIColor.black.cgColor
        nineTimesButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        randomButton.layer.shadowOpacity = 0.4
        randomButton.layer.shadowRadius = 1
        randomButton.layer.shadowColor = UIColor.black.cgColor
        randomButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        
    }
    
    @IBAction func questionsSelected(_ sender: UIButton) {
        
        if let selectedTimes = sender.titleLabel?.text {
            print(selectedTimes)
            quizBrain.createQuestions(times: selectedTimes)
        } else {
            let selectedTimes = K.QId.one
            quizBrain.createQuestions(times: selectedTimes)
        }
        
        self.performSegue(withIdentifier: K.questionSegue, sender: self)
    
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismissUI()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier ==  K.questionSegue {
            let destinationVC = segue.destination as! QuestionsViewController
            destinationVC.quizBrain = quizBrain
        }
    }
    
    @objc func dismissUI(){
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
        
    
}


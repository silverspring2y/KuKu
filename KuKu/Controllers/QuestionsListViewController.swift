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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func questionsSelected(_ sender: UIButton) {
        
        if let selectedTimes = sender.titleLabel?.text {
            print(selectedTimes)
            quizBrain.createQuestions(times: selectedTimes)
        } else {
            let selectedTimes = "1のだん"
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


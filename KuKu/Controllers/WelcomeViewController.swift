//
//  ViewController.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/08/15.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var selectQuestionsButton: UIButton!
    @IBOutlet weak var reviewQuestionsButton: UIButton!
    @IBOutlet weak var seeRecordsButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: K.JLabel.back,
            style: .plain,
            target: nil,
            action: nil
        )

        selectQuestionsButton.layer.shadowOpacity = 0.5
        selectQuestionsButton.layer.shadowRadius = 1
        selectQuestionsButton.layer.shadowColor = UIColor.black.cgColor
        selectQuestionsButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        reviewQuestionsButton.layer.shadowOpacity = 0.5
        reviewQuestionsButton.layer.shadowRadius = 1
        reviewQuestionsButton.layer.shadowColor = UIColor.black.cgColor
        reviewQuestionsButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        seeRecordsButton.layer.shadowOpacity = 0.5
        seeRecordsButton.layer.shadowRadius = 1
        seeRecordsButton.layer.shadowColor = UIColor.black.cgColor
        seeRecordsButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quizBrain = QuizBrain()
    }
    
    
    @IBAction func selectQuestionsButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.selectQuestionSegue, sender: self)
    }
    
    @IBAction func reviewQuestionsButtonPressed(_ sender: UIButton) {
        quizBrain.createQuestions(times: K.QId.review)
        
        if quizBrain.quiz.count > 0 {
            self.performSegue(withIdentifier: K.reviewQuestionsSegue, sender: self)
        } else {
            let alert: UIAlertController = UIAlertController(title: K.JLabel.noRecordsAlert, message: K.JLabel.noRecordsMessage, preferredStyle:.alert)
            let ok = UIAlertAction(title: K.JLabel.ok, style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
       }
    }
    
    @IBAction func seeRecordsButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.seeRecordsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier ==  K.selectQuestionSegue {
            //let destinationVC = segue.destination as! QuestionsListViewController
        } else if segue.identifier == K.reviewQuestionsSegue {
            let destinationVC = segue.destination as! QuestionsViewController
            destinationVC.quizBrain = quizBrain
        } else if segue.identifier == K.seeRecordsSegue {
            
        }
    }
}


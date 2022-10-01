//
//  Constants.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/09/17.
//

struct K {
    static let recordsFile = "PersonalRecords.plist"
    static let selectQuestionSegue = "goToQlist"
    static let reviewQuestionsSegue = "goToReviewQuestions"
    static let seeRecordsSegue = "goToRecords"
    static let questionSegue = "goToQuestions"
    
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "RecordCell"
    
    struct Shapes {
        static let correct = "circlebadge"
        static let wrong = "xmark"
    }
    
    struct JLabel {
        static let back = "戻る"
    }
    
}

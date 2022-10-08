//
//  Constants.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/09/17.
//

struct K {
    // filename
    static let recordsFile = "PersonalRecords.plist"
    
    // segue
    static let selectQuestionSegue = "goToQlist"
    static let reviewQuestionsSegue = "goToReviewQuestions"
    static let seeRecordsSegue = "goToRecords"
    static let questionSegue = "goToQuestions"
    
    // id
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "RecordCell"
    
    // question identifier
    struct QId {
        static let review = "review"
        static let random = "らんだむ"
        static let one = "1のだん"
    }
    
    struct Shapes {
        static let correct = "circlebadge"
        static let wrong = "xmark"
    }
    
    struct JLabel {
        static let noRecordsAlert = "きろくがありません！"
        static let noRecordsMessage = "苦手な問題はなさそうです"
        static let ok = "OK"
        static let back = "戻る"
    }
    
}

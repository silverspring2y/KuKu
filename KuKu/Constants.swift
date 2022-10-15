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
    
    struct ColorHex {
        static let navy = "#07689F"
        static let white = "FAFAFA"
        static let skyblue = "A2D5F2"
        static let red = "FF7E67"
        static let purple = "646FD4"
    }
    
    
    struct JLabel {
        static let noRecordsAlert = "きろくがありません！"
        static let noRecordsMessage = "苦手な問題が見つかりません"
        static let ok = "OK"
        static let back = "戻る"
        static let deleteRecordsAlert = "学習記録をリセットします"
        static let confirmDeletion = "本当に全て削除しますか？"
    }
}

//
//  SeeRecordsViewController.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/09/24.
//

import UIKit

class SeeRecordsViewController: UIViewController {

    @IBOutlet weak var recordsTableView: UITableView!
    
    var recordsDict: [Question: Records] = [:]
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(K.recordsFile)
    var sortedArray: Array<(key: Question, value: Records)> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecords()
        recordsTableView.dataSource = self
        recordsTableView.register(RecordCell.nib(), forCellReuseIdentifier: K.cellIdentifier)
        recordsTableView.delegate = self

    }
    

    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: K.JLabel.deleteRecordsAlert, message: K.JLabel.confirmDeletion, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: K.JLabel.ok, style: .default) { (action) in
            self.recordsDict = [:]
            self.sortedArray = []
            self.saveRecords()
        }
        let cancel = UIAlertAction(title: K.JLabel.back, style: .default) { (action) in
        }
        
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
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
        
        self.recordsTableView.reloadData()
    }
    
    func loadRecords(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                //recordsArray = try decoder.decode([Question].self, from: data)
                //print(recordsArray)
                recordsDict = try decoder.decode([Question: Records].self, from: data)
            } catch {
                print("Error decoding records array, \(error)")
            }
         
            sortedArray = recordsDict.sorted(by: { $0.key.question < $1.key.question})
            print(sortedArray)
//            print(sortArray[0])
            
        }
    }

}

extension SeeRecordsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



extension SeeRecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recordsDict.keys.count
        return sortedArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! RecordCell
        let question = sortedArray[indexPath.row].key.question
        let answer = sortedArray[indexPath.row].key.correctAnswer
        let wrongRate = sortedArray[indexPath.row].value.wrongRate
        cell.rateLabel.textColor = UIColor(hex: K.ColorHex.navy)
        cell.contentView.backgroundColor = UIColor(hex: K.ColorHex.white)
        cell.questionLabel.text = question
        cell.answerLabel.text = answer
        cell.rateLabel.text = String(format: "%.0f", 100*(1 - wrongRate))
        
        if wrongRate >= 0.3 {
            cell.rateLabel.textColor = UIColor(hex: K.ColorHex.red)
            cell.contentView.backgroundColor = UIColor(hex: K.ColorHex.red + "40")
        }
        
        return cell
    }
    
}

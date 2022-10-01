//
//  SeeRecordsTableViewController.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/09/18.
//

import UIKit

class SeeRecordsTableViewController: UITableViewController {

    var recordsDict: [Question: Records] = [:]
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(K.recordsFile)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRecords()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordsDict.keys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.recordsCellId, for: indexPath)
        //print(type(of: recordsDict.keys))
        //print(Array(recordsDict.keys)[indexPath.row])
        let record = Array(recordsDict.keys)[indexPath.row]
        print(record)
        cell.textLabel?.text = record.question
        

//        let message = messages[indexPath.row]
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
//        cell.label.text = message.body
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
            } catch {
                print("Error decoding records array, \(error)")
            }
            
        }
    }
    
    
}

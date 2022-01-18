//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import UIKit

class StudentListTableViewController: UITableViewController, UITextFieldDelegate{
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.sharedInstance.studentList.count // 5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        // Configure the cell...
        
        let studentList = StudentController.sharedInstance.studentList
        let studentForIndexPath = studentList[indexPath.row] // 0 // 1
        
        cell.textLabel?.text = studentForIndexPath.name
        cell.textLabel?.text?.append(": \(studentList[indexPath.row].cohortNumber)")
        
        return cell
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                        // Delete the row from the data source
            let student = StudentController.sharedInstance.studentList[indexPath.row]
            
            StudentController.sharedInstance.deleteStudent(student: student)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destination = segue.destination as? StudentDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                let studentToPass = StudentController.sharedInstance.studentList[indexPath.row]
                destination.studentReceiver = studentToPass
            }
        }
    }
}

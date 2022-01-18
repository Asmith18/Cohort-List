//
//  StudentDetailViewController.swift
//  CohortList
//
//  Created by adam smith on 1/18/22.
//

import UIKit

//MARK: - Outlets
class StudentDetailViewController: UIViewController {
    @IBOutlet weak var studentDetails: UITextView!
    @IBOutlet weak var cohortNumText: UITextField!
    @IBOutlet weak var studentNameText: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(student: studentReceiver)
    }
    //MARK: - Properties
    var studentReceiver: Student? = nil
    
    //MARK: - Helper Methods
    func updateViews(student: Student?) {
        guard let student = student else { return }
        studentNameText.text = student.name
        cohortNumText.text = String(student.cohortNumber)
        studentDetails.text = student.studentDescription
    }
    
    func clearData() {
        studentDetails.text = ""
        cohortNumText.text = ""
        studentNameText.text = ""
    }
    //MARK: - Actions
    @IBAction func deleteBtn(_ sender: UIButton) {
        if let studentReceiver = studentReceiver {
            StudentController.sharedInstance.deleteStudent(student: studentReceiver)
            self.navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func clearBtn(_ sender: UIButton) {
        clearData()
    }
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        guard let name = studentNameText.text, let cohortNum = cohortNumText.text, let studentDetails = studentDetails.text, let studentCohortNumber = Int (cohortNum) else { return }
        
        
        if let studentReceiver = studentReceiver {
            // has a value. the user wants to update
            StudentController.sharedInstance.updateStudent(student: studentReceiver, newName: name, newCohortNum: studentCohortNumber, newDescription: studentDetails)
            
        } else {
            //does not have a value. the user wants to do create
            StudentController.sharedInstance.createStudent(name: name, cohortNumber: studentCohortNumber, studentDescription: studentDetails)
        }
        self.navigationController?.popViewController(animated: true)
    }
}//MARK: - End of Class

//
//  StudentDetailViewController.swift
//  CohortList
//
//  Created by adam smith on 1/18/22.
//

import UIKit

class StudentDetailViewController: UIViewController {
    @IBOutlet weak var studentDetails: UITextView!
    @IBOutlet weak var cohortLabel: UILabel!
    @IBOutlet weak var cohortNumText: UITextField!
    @IBOutlet weak var studentNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func deleteBtn(_ sender: UIButton) {
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
    }
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

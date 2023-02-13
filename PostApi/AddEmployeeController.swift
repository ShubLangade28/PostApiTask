//
//  AddEmployeeController.swift
//  PostApi
//
//  Created by shubhan.langade on 06/10/22.
//

import UIKit

class AddEmployeeController: UIViewController {
    let networkManager = NetworkManager()
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var surnameTextfield: UITextField!
    @IBOutlet weak var designationTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let notificationCenter = NotificationCenter.default
          //  notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
//    @objc func appMovedToBackground() {
//        print("App moved to background!")
//    }
    
    @IBAction func addEmployee(_ sender: UIButton) {
        let para = ["empName" : nameTextfield.text!, "empSurname" : surnameTextfield.text!, "empDesignation" : designationTextfield.text!]
        networkManager.postApi(para: para)
    }

}

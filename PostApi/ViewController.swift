//
//  ViewController.swift
//  PostApi
//
//  Created by shubhan.langade on 06/10/22.
//

import UIKit

class ViewController: UIViewController {
let networkManager = NetworkManager()
    var emp = [Employee]()
    @IBOutlet weak var empTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        empTable.delegate = self
        empTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.networkManager.getApi { empData in
                self.emp = empData
            DispatchQueue.main.async {
                self.empTable.reloadData()
            }
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        let addEmpVC = storyboard?.instantiateViewController(withIdentifier: "AddEmployeeController") as! AddEmployeeController
        self.emp.removeAll()
        navigationController?.pushViewController(addEmpVC, animated: true)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = empTable.dequeueReusableCell(withIdentifier: "cellS", for: indexPath)
        cell.textLabel?.text = emp[indexPath.row].empName + emp[indexPath.row].empSurname
        cell.detailTextLabel?.text = emp[indexPath.row].empDesignation
        return cell
    }
    
    
}

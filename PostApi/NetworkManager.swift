//
//  NetworkManager.swift
//  PostApi
//
//  Created by shubhan.langade on 06/10/22.
//

import Foundation

class NetworkManager
{
    private let urlSession : URLSession
    init()
    {
        self.urlSession = URLSession(configuration: .default)
    }
    func getApi(complitionHandler : @escaping ([Employee])->())
    {
       let url = URL(string: "https://633440bb90a73d0fedeab860.mockapi.io/emp")
       let task = urlSession.dataTask(with: url!) { data, response, error in
           guard let jsonData = data else{return}
           let urlResponse = response as! HTTPURLResponse
           print(urlResponse.statusCode)
           let empData = self.parseApi(data: jsonData)
           complitionHandler(empData)
        }
        task.resume()
    }
    
    func parseApi(data : Data) -> [Employee]
    {
        var empData = [Employee]()
        do
        {
            let employees = try JSONDecoder().decode([Employee].self, from: data)
            print(employees)
            empData = employees
        }
        catch let e
        {
            print(e.localizedDescription)
        }
        return empData
    }
    
    func postApi(para : [String : Any])
    {
        let url = URL(string: "https://633440bb90a73d0fedeab860.mockapi.io/emp")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        do
        {
            request.httpBody = try JSONSerialization.data(withJSONObject: para, options: .prettyPrinted)
        }
        catch let e
        {
            print(e.localizedDescription)
        }
        let task = urlSession.dataTask(with: request) { data, response, error in
            guard let jsonData = data else{return}
            do
            {
                let employees = try JSONDecoder().decode(Employee.self, from: jsonData)
                print(employees)
            }
            catch let e
            {
                print(e.localizedDescription)
            }
        }
        task.resume()
    }
}

//
//  ViewController.swift
//  UITableviewProgramatically
//
//  Created by admin on 28/03/2022.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    var usersList: [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
        usersData()
        // Do any additional setup after loading the view.
    }

    func addTableView(){
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
        tableView.register(UserListCellView.self, forCellReuseIdentifier: "cell")
        usersData()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func usersData() {
        let session = URLSession.shared
        let urlString = "https://reqres.in/api/users"
        guard let url = URL(string: urlString) else {return}
        
        let dataTask = session.dataTask(with: url) {data, responce, error in
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do{
                let decodedResponce = try JSONDecoder().decode(UserResponceModel.self, from: data)
                self.usersList = decodedResponce.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListCellView
        let user = usersList[indexPath.row]
        cell.userimageView.addImage(avatar: usersList[indexPath.row].avatar!)
        cell.userimageView.addImage(avatar: user.avatar ?? "")
        cell.emailLabel.text = "\(usersList[indexPath.row].email)"
        cell.fnameLable.text = "\(usersList[indexPath.row].first_name)"
        cell.lnameLable.text = "\(usersList[indexPath.row].last_name)"
        
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 150
        }

}


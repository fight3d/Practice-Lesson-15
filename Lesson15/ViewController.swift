//
//  ViewController.swift
//  Lesson15
//
//  Created by 3droot on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users : [Users] = []
    
    private let service = UserService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getUsers { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showUserDetails", let vc = segue.destination as? UserDetailsViewController,
           let selectedUser = sender as? Users{
            vc.selectedUser = selectedUser
        }
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showUserDetails", sender: users[indexPath.row])
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name.first + " " + user.name.last
        cell.detailTextLabel?.text = user.phone
        return cell
    }
    
    
}




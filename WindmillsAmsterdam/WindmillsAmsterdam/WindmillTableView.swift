//
//  WindmillTableView.swift
//  WindmillsAmsterdam
//
//  Created by Ben Smith on 12/01/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import Firebase

class WindmillTableView: UITableViewController {

    var clientTable: UITableView!
    var ref: FIRDatabaseReference!
    var messages: [FIRDataSnapshot] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    fileprivate var _refHandle: FIRDatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatabase()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableviewcellid")
        view.accessibilityIdentifier = "tableview"
        // Do any additional setup after loading the view.
    }

    deinit {
        self.ref.child("messages").removeObserver(withHandle: _refHandle)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func configureDatabase() {
        ref = FIRDatabase.database().reference()
        // Listen for new messages in the Firebase database
        _refHandle = self.ref.child("ShoppingItems").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
            guard let strongSelf = self else { return }
            strongSelf.messages.append(snapshot)
            //strongSelf.tableView.insertRows(at: [IndexPath(row: strongSelf.messages.count-1, section: 0)], with: .automatic)
        })
        

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue cell
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableviewcellid", for: indexPath)
        // Unpack message from Firebase DataSnapshot
        let messageSnapshot: FIRDataSnapshot! = self.messages[indexPath.row]
        let message = messageSnapshot.value as! Dictionary<String, AnyObject>
        let name = message[Constants.MessageFields.name] as! String!
        let text = message[Constants.MessageFields.price] as! Int!
        cell.textLabel?.text = name! + ": \(text)"
//        cell.imageView?.image = UIImage(named: "ic_account_circle")
//        if let photoURL = message[Constants.MessageFields.photoURL], let URL = URL(string: photoURL), let data = try? Data(contentsOf: URL) {
//            cell.imageView?.image = UIImage(data: data)
//        }
        return cell
    }

}

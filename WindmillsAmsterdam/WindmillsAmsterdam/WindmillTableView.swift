//
//  WindmillTableView.swift
//  WindmillsAmsterdam
//
//  Created by Ben Smith on 12/01/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import Firebase

class WindmillTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var clientTable: UITableView!
    var ref: FIRDatabaseReference!
    var windmills: [FIRDataSnapshot]! = []
    fileprivate var _refHandle: FIRDatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clientTable.register(UITableViewCell.self, forCellReuseIdentifier: "ClientCell")

        configureDatabase()

        // Do any additional setup after loading the view.
    }

    deinit {
//        self.ref.child("Windmills").removeObserver(withHandle: _refHandle)
    }
    
    
    func configureDatabase() {
        ref = FIRDatabase.database().reference()
        // Listen for new messages in the Firebase database
        _refHandle = self.ref.child("Windmills").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
            guard let strongSelf = self else { return }
            strongSelf.windmills.append(snapshot)
            strongSelf.clientTable.insertRows(at: [IndexPath(row: strongSelf.windmills.count-1, section: 0)], with: .automatic)
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue cell
        let cell = self.clientTable .dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath)
        // Unpack message from Firebase DataSnapshot
        let messageSnapshot: FIRDataSnapshot! = self.windmills[indexPath.row]
        let message = messageSnapshot.value as! Dictionary<String, String>
        let name = message[Constants.MessageFields.name] as String!
        let text = message[Constants.MessageFields.text] as String!
        cell.textLabel?.text = name! + ": " + text!
//        cell.imageView?.image = UIImage(named: "ic_account_circle")
//        if let photoURL = message[Constants.MessageFields.photoURL], let URL = URL(string: photoURL), let data = try? Data(contentsOf: URL) {
//            cell.imageView?.image = UIImage(data: data)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let windmills = windmills {
            return windmills.count
        } else {
            return 0
        }
    }
}

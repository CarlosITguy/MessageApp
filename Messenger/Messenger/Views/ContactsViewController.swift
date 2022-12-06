//
//  ContactsViewController.swift
//  Messenger
//
//  Created by Consultant on 12/4/22.
//

import UIKit
import Firebase


class ContactsViewController: UIViewController {
    var messages : [message] = []
    var messages1 : [String] = []
    var count : Int = 0
    var messagesNS : [NSObject] = []
//    let FireDB = Database.database()
    let baseUrl  : String = "https://chateamos-1-default-rtdb.firebaseio.com/"
    var contactTable : UITableView = UITableView(frame: .zero)
    var textSpace : UITextField = UITextField()
    var sendButoom : UIButton = UIButton(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getMessages()
        
        self.contactTable.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsCell")
        self.contactTable.dataSource = self
        
        Database.database().reference()
            .child("messages")
            .queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
                snapshot.children.forEach{
//                    print("this is one\(String(describing: ($0.self)))")
                    self.messages1.append(String(describing: ($0.self)))
                    self.contactTable.reloadData()

//                    print(self.messages1)
                }

            })
    }
    
    
    func setupTable(){
        view.backgroundColor = .cyan
        
        let cht = self.contactTable
        view.addSubview(self.contactTable)
        cht.layer.cornerRadius = 40
        cht.backgroundColor = .brown
        cht.translatesAutoresizingMaskIntoConstraints = false
        cht.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 8).isActive = true
        cht.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 8).isActive = true
        cht.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        cht.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor ,constant: -70).isActive = true
       
        
        let text = self.textSpace
        view.addSubview(text)
        text.layer.cornerRadius = 10
        text.backgroundColor = .red
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 8).isActive = true
        text.topAnchor.constraint(equalTo: cht.bottomAnchor ,constant: 8).isActive = true
        text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor ,constant: -70).isActive = true
        text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor ,constant: -8).isActive = true
        
        let buttom = self.sendButoom
        view.addSubview(buttom)
        buttom.layer.cornerRadius = 30
        buttom.backgroundColor = .orange
        buttom.layer.borderColor = .init(srgbRed: 0.5, green: 0, blue: 0, alpha: 1)
        buttom.setTitle("hi", for: .normal)
        buttom.setImage(UIImage(systemName: "paperplane"), for: .normal)
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.leadingAnchor.constraint(equalTo: text.trailingAnchor ,constant: 8).isActive = true
        buttom.topAnchor.constraint(equalTo: cht.bottomAnchor ,constant: 8).isActive = true
        buttom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor ,constant: -8).isActive = true
        buttom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor ,constant: -8).isActive = true
        
        self.textSpace = text
        self.contactTable = cht
        self.sendButoom = buttom
        buttom.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)

    }
    
    @objc func pressed() {
        self.messages1 = []
        print("button press")
        self.contactTable.reloadData()
        let ref = Database.database().reference()
        
        guard let body = self.textSpace.text else {return}
        
        if body != "" {
            ref.child("messages").childByAutoId().setValue(["UID" : "try 1", "body": body, "timestamp": "\(Date())", "username" : "Carlos"])
        }
        
        
        
        
//        self.messages1 = []
        ref
            .child("messages")
            .queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
                snapshot.children.forEach{
//                    print("this is one\(String(describing: ($0.self)))")
                    self.messages1.append(String(describing: ($0.self)))
//                    print(self.messages1)
                    self.contactTable.reloadData()

                }

            })
        print(self.textSpace.text)


    }
    
    
    func getMessages(){
        

        let ref = Database.database().reference()
//        ref.child("messages").childByAutoId().setValue(["UID" : "no needed", "body": "editor", "timestamp": "\(Date())", "username" : "Carlos"])

        ref.child("messages").observeSingleEvent(of: .value) { data in
            print("------separation of levels ----")
            //            print(ref.child("messages").child("UID ="))
        }
        
//        print( ref.child("messages").child(Auth.auth().currentUser!.uid).description().self )
        //             var message = data.children.allObjects[5].self
//            print(message)
//            self.messagesNS.append(message as! NSObject)
//            print(data.children.allObjects[5].self)
    //            data.children.forEach{
////                self.messages1.append(String(describing: $0.self))
//                print($0.self)
//
//            }
//            print(self.messagesNS as? NSDictionary)
            
            print("------separation of levels ----")
            
//            print(self.messagesNS.compactMap{$0.description.self})
        }
        
//        print(reference.child("Kun").observe(.value, with: { DataSnapshot in
//            print(DataSnapshot)
//        }))
//
            
  
    }
    

extension ContactsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactTable.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as? ContactsTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .clear
//        cell.textLabel?.text = "Hola"
        cell.chatMessanges.text = self.messages1[indexPath.row]
        cell.layer.cornerRadius = 100
        return cell
        
    }
    
    
    
    
}

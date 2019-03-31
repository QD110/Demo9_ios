//
//  DetailediewControllerViewController.swift
//  Demo9
//
//  Created by 钱金磊 on 2019/3/31.
//  Copyright © 2019 qjl. All rights reserved.
//

import UIKit

class DetailediewControllerViewController: UITableViewController {
    
    
    @IBOutlet weak var duty: UITableViewCell!
    
    @IBOutlet weak var name: UITableViewCell!
    
   
    @IBOutlet weak var phone: UITableViewCell!
    
    var person : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        guard var person : Person = person! else{
                return
        }
    //print(person.name)
            name.textLabel?.text = person.name
            phone.textLabel?.text = person.phone
            duty.textLabel?.text = person.title

        
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        let person = Person()
        person.name = name.textLabel?.text
        person.phone = phone.textLabel?.text
        person.title = duty.textLabel?.text
        
    }
    
    


}

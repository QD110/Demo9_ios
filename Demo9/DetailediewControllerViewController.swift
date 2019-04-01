//
//  DetailediewControllerViewController.swift
//  Demo9
//
//  Created by 钱金磊 on 2019/3/31.
//  Copyright © 2019 qjl. All rights reserved.
//

import UIKit

class DetailediewControllerViewController: UITableViewController {
    

    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var duty: UITextField!
    
    
    var person : Person?
    
    var blockCallBack: ( () -> () )?
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        guard var person : Person = person! else{
                return
        }
        name.text = person.name
        phone.text = person.phone
        duty.text = person.title
        
       

        
    }
    
    @IBAction func sdasd(_ sender: Any) {
        person?.name = name.text
        
         person?.phone = phone.text
        
         person?.title = duty.text
        blockCallBack?()
        
        _ = navigationController?.popToRootViewController(animated: true)
    }

}

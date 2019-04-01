//
//  ListTableViewController.swift
//  Demo9
//
//  Created by 钱金磊 on 2019/3/31.
//  Copyright © 2019 qjl. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var data : [Person]! = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData { (data) in
           
            self.data += data
            
            self.tableView.reloadData()
        }
        
    }
    
    var person : Person?
    // mark: -控制器y跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailediewControllerViewController
        if let indexPath = sender as? IndexPath{
            vc.person = data[indexPath.row]
            vc.blockCallBack = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
        }
        
    }
    
    
    // mark: -代理方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 执行 segue
        performSegue(withIdentifier: "detailed2list", sender: indexPath)
    }
    
    
    func initData(result: @escaping (_ : [Person]) -> ())  {

       var arrayData = [Person]()
        DispatchQueue.global().async {
            for i in 0..<20{
                let person = Person()
                person.name = "张三_\(i)"
                person.phone = "18525444__\(i)"
                person.title = "志愿——\(i)"
                arrayData.append(person)
            }
            
            Thread.sleep(forTimeInterval: 1.5)
            
            DispatchQueue.main.async {
                result(arrayData)
            }
            
            
        }
      
        
        
        
        
        
        
        
        
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return data.count
    }
    
    
   //dequeueReusableCellWithIdentifier
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        cell.detailTextLabel?.text = data[indexPath.row].phone
        return cell
        
    }


}

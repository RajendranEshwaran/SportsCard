//
//  ViewController.swift
//  SportsCard
//
//  Created by gomathi saminathan on 12/10/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var sportsTable: UITableView!
    
    var TempArray:[String] = ["1","2","3"]
    var sporttypemodel = [SportsTypeModel]()
    var fRef1:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

       readDataFromFirebaseDatabase()
        
    }
    
    @IBAction func addSportsType(_ sender: Any) {
       
        var vc:UIViewController?
        vc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddSportTypeViewController") as? AddSportTypeViewController)!

        self.present(vc!, animated: true, completion: nil)
    }
    func readDataFromFirebaseDatabase()
    {
        fRef1 = Database.database().reference().child("SportTypeTable")
           
               
               fRef1.observe(DataEventType.value, with: {(snapshot) in
                       
                   if snapshot.childrenCount > 0
                   {
                       self.sporttypemodel.removeAll()
                       
                       for data in snapshot.children.allObjects as! [DataSnapshot]
                       {
                           let obj = data.value as? [String:AnyObject]
                           let s_name = obj?["sportname"]
                           let t_count = obj?["totalplayer"]
                           
                          let modelObject = SportsTypeModel.init(s_name: s_name as! String, t_player: t_count as! String)
               
                          self.sporttypemodel.append(modelObject)
                         
                         print("name \(String(describing: s_name))")
                        print("playercount \(String(describing: t_count))")

                       }
                       self.sportsTable.reloadData()
                   }
                   })
    }
    
    

}



extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sporttypemodel.count
        
        return sporttypemodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportNameListCell", for: indexPath) as! SportNameListCell
        
        let model:SportsTypeModel
        model = sporttypemodel[indexPath.row]
        cell.sportsNameLbl.text = model.sportName
        cell.totalPlayerCountLbl.text = model.totalPlayer
        return cell
    }
}


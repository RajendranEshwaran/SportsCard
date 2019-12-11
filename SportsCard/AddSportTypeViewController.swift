//
//  AddSportTypeViewController.swift
//  SportsCard
//
//  Created by gomathi saminathan on 12/10/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class AddSportTypeViewController: ViewController {
    
    @IBOutlet weak var totalPlayerTxt: UITextField!
    @IBOutlet weak var sportsNameTxt: UITextField!
    
   //var sportmodel = [SportsTypeModel]()
    
    @IBOutlet weak var statusLbl: UILabel!
    var fRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // FirebaseApp.configure()
        // Step1
        // Create the firebase database ref
        fRef = Database.database().reference().child("SportTypeTable")
    }
    @IBAction func addToFireBaseDatabase(_ sender: Any)
    {
        writeDataToFirebaseDatabase()
        
    }
    func writeDataToFirebaseDatabase()
    {
        // Step1
        // Create unique key for child node ( SportTypeTable )
        let key = fRef.childByAutoId().key
        
        // Step 2
        // Create values base for key
        let sName = ["id":key,
                     "sportname":sportsNameTxt.text! as String,
                     "totalplayer":totalPlayerTxt.text! as String]
        
        fRef.child(key!as String).setValue(sName)
        
        statusLbl.text = "Data Added into Firebase"
    }
    
}


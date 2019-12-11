//
//  SportTypeModel.swift
//  SportsCard
//
//  Created by gomathi saminathan on 12/10/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import Foundation

class SportsTypeModel
{
    var sportName:String?
    var totalPlayer:String?
   // var id:Int?
    init(s_name:String, t_player:String) {
        
        self.sportName = s_name
        self.totalPlayer = t_player
       // self.id = id
    }
}

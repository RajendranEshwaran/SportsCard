//
//  SportNameListCell.swift
//  SportsCard
//
//  Created by gomathi saminathan on 12/10/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class SportNameListCell: UITableViewCell {

    @IBOutlet weak var sportsNameLbl: UILabel!
   
    @IBOutlet weak var totalPlayerCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

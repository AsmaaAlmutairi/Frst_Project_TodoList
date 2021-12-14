//
//  TodoCall.swift
//  Frst_Project_TodoList
//
//  Created by ا on 29/04/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import UIKit

class TodoCall: UITableViewCell {

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var todoCreatDateLabel: UILabel!
    @IBOutlet weak var todoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

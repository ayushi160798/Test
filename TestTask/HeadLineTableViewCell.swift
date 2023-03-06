//
//  HeadLineTableViewCell.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import UIKit

class HeadLineTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewTbl: UIView!
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

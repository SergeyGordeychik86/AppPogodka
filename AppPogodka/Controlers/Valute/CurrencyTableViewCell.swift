//
//  CurrencyTableViewCell.swift
//  AppPogodka
//
//  Created by MacBook on 12.06.2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var curNameLabel: UILabel!
    @IBOutlet weak var officialRateLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

        // Configure the view for the selected state
    }

}

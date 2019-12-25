//
//  CarCell.swift
//  BikeCar
//
//  Created by Drivemate IOS on 24/12/2562 BE.
//  Copyright © 2562 Drivemate IOS. All rights reserved.
//

import Foundation
import  UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carImage.layer.cornerRadius = 6
        carImage.layer.borderColor = UIColor.gray.cgColor
        carImage.layer.borderWidth = 0.5
    }
}

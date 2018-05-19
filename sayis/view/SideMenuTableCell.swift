//
//  sideMenuTableCell.swift
//  sayis
//
//  Created by ahmedxiio on 4/2/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class SideMenuTableCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var listeItemUIImage: UIImageView!
    @IBOutlet weak var listIemName: UILabel!
//    @IBOutlet weak var listItembackImge: UIImageView!
    
    @IBOutlet weak var listItembackImge: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        updatViews()
    }
    func updatViews(sideMenuModel:SideMenuModel){
        listeItemUIImage.image = UIImage(named :sideMenuModel.listIemImagName )
        listIemName.text = sideMenuModel.listIemName
        listItembackImge.image = UIImage(named :sideMenuModel.listItembackImge )

    }

}

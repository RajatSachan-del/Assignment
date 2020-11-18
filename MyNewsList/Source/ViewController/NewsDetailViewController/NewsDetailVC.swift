//
//  NewsDetailVC.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import UIKit
import SDWebImage


class NewsDetailVC: UIViewController {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSectionWithDate: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var model = NewsDetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.sd_setImage(with: URL(string: model.imageURL ?? ""), placeholderImage: UIImage(named: "placeholder"))
        lblTitle.text = model.title
        
        lblDescription.text = model.discription
        
        
        
        if let subSection = model.subSection {
            lblSectionWithDate.text = model.section! + " | "  + subSection + " | " + model.publicedDate!
        } else {
            lblSectionWithDate.text = model.section! + " | " + model.publicedDate!
        }
    
    }


}

//
//  NewsCellTVC.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import UIKit
import SDWebImage


class NewsCellTVC: BaseTVC {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var imgViewArrow: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgViewCalender: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 30.0
    }
    
    override func displayData(model: BaseTableCellProtocol) {
        
        if let newsDataModel = model as? NewsDetailModel {
            lblNewsTitle.text = newsDataModel.title
            lblDate.text = newsDataModel.publicedDate
            
            imgView.sd_setImage(with: URL(string: newsDataModel.imageURL ?? ""), placeholderImage: UIImage(named: "placeholder"))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

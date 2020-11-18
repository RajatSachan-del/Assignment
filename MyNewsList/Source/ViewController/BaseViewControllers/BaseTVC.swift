//
//  BaseTVC.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import UIKit

class BaseTVC: UITableViewCell {

    var cellActionDelegate : CellActionListner?
    var position : Int!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayData(model : BaseTableCellProtocol){
        print("Display data of Base Home TVC")
    }
    
    
    
    func onAction(actionType : CellAction){
        if let delegate = cellActionDelegate{
            delegate.onCellAction(actionType: actionType, position: position)
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}


enum TABLE_CELL_TYPE : Int {
    case NEWS_LIST_ITEM
    
}

protocol BaseTableCellProtocol {
    func getCellType()->TABLE_CELL_TYPE
    func getCellNibName()->String
}

protocol CellActionListner {
    func onCellAction(actionType : CellAction, position : Int);
}

enum CellAction : Int {
    case GENERIC_LIST_ITEM_CLICKED
}

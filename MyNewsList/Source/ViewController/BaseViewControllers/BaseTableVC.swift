//
//  BaseTableVC.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import UIKit

class BaseTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CellActionListner {

    var list = [BaseTableCellProtocol]();
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func showProgessBar(view: UIView) {
        
    }
    
    func registerNib(_ nibName: String){
        print("Register Nib")
        let nib = UINib(nibName: nibName, bundle: nil)
        self.getTableView()?.register(nib, forCellReuseIdentifier: nibName)
    }
    
    override func viewWillLayoutSubviews() {
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("List Count")
        return list.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("Number of Sections")
        return 1;
    }
    // Need to be overidden for sure
    func getTableView()->UITableView?{
        print("GetTableView")
        return nil;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCellView(indexPath: indexPath, tableView: tableView) as! BaseTVC
        let model = list[indexPath.row];
        cell.displayData(model: model)
        cell.cellActionDelegate = self;
        cell.position = indexPath.row;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getCellHeight(indexPath: indexPath);
    }
    
    func getCellView(indexPath : IndexPath, tableView : UITableView)->UITableViewCell{
        let cellModel : BaseTableCellProtocol = list[indexPath.row]
        let cell = self.getTableView()?.dequeueReusableCell(withIdentifier: cellModel.getCellNibName(), for: indexPath) as? BaseTVC
            cell!.updateConstraintsIfNeeded()
            cell!.selectionStyle = UITableViewCell.SelectionStyle.none
            cell!.backgroundColor = UIColor.clear
        return cell!;
    }
    
    func getCellHeight(indexPath : IndexPath)->CGFloat{
        let cellModel : BaseTableCellProtocol = list[indexPath.row]
        return getCellHeight(cellType: cellModel.getCellType())
    }
    
    func getCellHeight(cellType : TABLE_CELL_TYPE)->CGFloat{
        switch cellType {
//        case .GENERIC_LIST_ITEM:
//            return 50;
        default:
            return UITableView.automaticDimension;
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
        onCellClicked(indexPath : indexPath)
    }
    
    func onCellClicked(indexPath : IndexPath){
        
    }
    
    func onCellAction(actionType: CellAction, position: Int) {
        
    }
    
    func popOrDismiss(){
        if let nav = self.navigationController{
            nav.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return getCellHeight(indexPath: indexPath)
    }
    
    func refreshTable(){
        DispatchQueue.main.async {
            self.getTableView()?.reloadData()
            self.getTableView()?.tableFooterView = UIView()
        }
    }
    
    func removeExtraDividers(){
        self.getTableView()?.tableFooterView = UIView()
    }

}



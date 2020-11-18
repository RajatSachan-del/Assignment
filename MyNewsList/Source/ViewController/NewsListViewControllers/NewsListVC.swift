//
//  ViewController.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import UIKit

class NewsListVC: BaseTableVC, UISearchBarDelegate {

   
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var viewPopUP: UIView!
    @IBOutlet weak var lblOneDay: UILabel!
    @IBOutlet weak var btnOneDay: UIButton!
    @IBOutlet weak var lblSevenDay: UILabel!
    @IBOutlet weak var btnSevenDay: UIButton!
    @IBOutlet weak var lblThirtyDay: UILabel!
    @IBOutlet weak var btnThirtyDay: UIButton!
    @IBOutlet weak var btnSearchBar: UIBarButtonItem!
    
    
    
    
    let SECRET_KEY = "pVMOyLL9jzL6sXT3P5rrj72f8GIxVlUJ"
    
    var finalList = [BaseTableCellProtocol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=" + SECRET_KEY
        getNewsListDataFromApi(strURL: urlString)
        registerNib("NewsCellTVC")
       // initList()
        
        self.viewPopUP.isHidden = true
        self.navigationVIewSetUP()
        
    }
    
    
    
    override func showProgessBar(view: UIView) {
        
    }
    
    func navigationVIewSetUP() {
         
        btnSearchBar.tintColor = .white
         self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 217.0/255.0, blue: 198.0/255, alpha: 1.0)
    }
    


    override func getTableView() -> UITableView? {
        return tblView
    }
    
    override func onCellClicked(indexPath: IndexPath) {
        let item: BaseTableCellProtocol = self.list[indexPath.row];
        switch item.getCellType() {
        case .NEWS_LIST_ITEM:
            
            let newsDetailVC = NewsDetailVC(nibName:"NewsDetailVC",bundle: nil)
            if let selectedDetailModel = self.list[indexPath.row] as? NewsDetailModel {
                newsDetailVC.model = selectedDetailModel
            }
            self.navigationController?.pushViewController(newsDetailVC, animated: true)
            break;
        default:
            break;
        }
        
    }
    
   
    @IBAction func clickOneDayButton(_ sender: UIButton) {
    
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=" + SECRET_KEY
        self.getNewsListDataFromApi(strURL: urlString)
        self.viewPopUP.isHidden = true
    }
    
    
    @IBAction func clickSevenDayButton(_ sender: UIButton) {
        
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=" + SECRET_KEY
        self.getNewsListDataFromApi(strURL: urlString)
        self.viewPopUP.isHidden = true
    }
    
    @IBAction func clickThirtyDayButton(_ sender: UIButton) {
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=" + SECRET_KEY
        self.getNewsListDataFromApi(strURL: urlString)
        self.viewPopUP.isHidden = true
    }
    
    @IBAction func clickSearchBarButton(_ sender: UIBarButtonItem) {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.clear]
        btnSearchBar.tintColor = .clear
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 50, y: 4, width: 200, height: 35)
        searchBar.delegate = self
        self.navigationController?.navigationBar.addSubview(searchBar)
    }
    
    
    // This method updates filteredData based on the text in the Search Box
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        if searchText.count == 0 {
            self.list = self.finalList
        } else {
            self.list = self.finalList.filter() { (($0 as! NewsDetailModel).title?.uppercased().contains(searchText.uppercased()))! }
        }
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
        
       }

    
    @IBAction func clickDaysSelectionButton(_ sender: UIBarButtonItem) {
      
        self.viewPopUP.isHidden = false
    }
    
    func getNewsListDataFromApi(strURL: String) {
        
      /*  let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
                activityIndicator.color = UIColor.darkGray
        self.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()*/
        
        Utility.shareInstance.showProgressIndicator(view: self.view)
        
        DataManager.sharedInstance.getAllNewsList(strURL) { (statusCode, resultData) in
          
            DispatchQueue.main.async {
                Utility.shareInstance.stopProgressIndicator()
            }
            
            print(resultData)
            self.finalList.removeAll()
            if let arrayOfResult = resultData["results"] as? [[String : Any]] {
               
                for dictData in arrayOfResult {
                  
                   let model = NewsDetailModel()
                    model.setNewsData(newsData: dictData)
                    self.finalList.append(model)
                }
            }
            self.list = self.finalList
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
    
}


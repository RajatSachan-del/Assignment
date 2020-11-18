//
//  NewsDetailModel.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import Foundation

class NewsDetailModel: BaseTableCellProtocol {
    
    var title: String?
    var publicedDate: String?
    var updateDate: String?
    var imageURL: String?
    var discription: String?
    var section: String?
    var subSection: String?
   
    
    func getCellType() -> TABLE_CELL_TYPE {
        return TABLE_CELL_TYPE.NEWS_LIST_ITEM
    }
    
    func getCellNibName() -> String {
        return "NewsCellTVC"
    }
   
    
    
     func setNewsData(newsData: [ String: Any ]) {
       
        if let newsTitle = newsData["title"] as? String {
            self.title = newsTitle
        }
        if let publiceDate = newsData["published_date"] as? String {
            self.publicedDate = publiceDate
        }
        
        if let discriptionValue = newsData["abstract"] as? String {
           discription = discriptionValue
        }
        
        if let valueOfSection = newsData["section"] as? String {
            section = valueOfSection
        }
        
        if let valueOfSubSection = newsData["subsection"] as? String {
            subSection = valueOfSubSection
        }
        
        if let mediaData = newsData["media"] as? [[String : Any]] {
            if mediaData.count > 0 {
                let mediaDetailData = mediaData[0]
                if let mediaMetaDataArray = mediaDetailData["media-metadata"] as? [[String : Any]] {
                    if mediaMetaDataArray.count > 0 {
                        let metaDataDetail = mediaMetaDataArray[0]
                        if let url = metaDataDetail["url"] as? String {
                            imageURL = url
                        }
                    }
                }
            }
            
            
        }
        
    }
    
}

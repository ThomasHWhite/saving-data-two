//
//  Store.swift
//  BetterModel
//
//  Created by Thomas White on 4/27/16.
//  Copyright © 2016 TH White Consulting. All rights reserved.
//

import Foundation

class Store: NSObject, NSCoding {
    var dataList = [Model]()
    
    override init() {
        super.init()
        loadStore()
    }
    
    required init?(coder aDecoder: NSCoder) {
        dataList = aDecoder.decodeObjectForKey("List") as! [Model]
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(dataList, forKey: "List")
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return(documentsDirectory() as NSString).stringByAppendingPathComponent("BetterModel.plist")
    }
    
    func saveStore() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(dataList, forKey: "List")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadStore() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                dataList = unarchiver.decodeObjectForKey("List") as! [Model]
                unarchiver.finishDecoding()
            }
        }
    }
    
}
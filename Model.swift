//
//  Model.swift
//  BetterModel
//
//  Created by Thomas White on 4/14/16.
//  Copyright © 2016 TH White Consulting. All rights reserved.
//

import Foundation

class Model: NSObject, NSCoding {
    var name: String
    var grade: Int
    
    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        grade = aDecoder.decodeIntegerForKey("Grade")
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeInteger(grade, forKey: "Grade")
    }
    
}


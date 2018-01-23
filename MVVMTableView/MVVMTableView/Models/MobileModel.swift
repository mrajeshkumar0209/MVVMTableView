//
//  MobileModel.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 22/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class MobileModel: NSObject {
    var ModelName:String?
    var MobileName:String?
    var MnfgYear:String?
    var MnfgCompany:String?
    var photoName:String?
    
    init(name:String,model:String,company:String,Year:String,image:String ) {
        self.MobileName = name
        self.ModelName = model
        self.MnfgCompany = company
        self.MnfgYear = Year
        self.photoName = image
    }
}

//class AppModel: NSObject {
//    var AppName:String?
//    var appDesc:String?
//    var photoName:String?
//    init(name:String,desc:String,image:String ) {
//        self.AppName = name
//        self.appDesc = desc
//        self.photoName = image
//    }
//}


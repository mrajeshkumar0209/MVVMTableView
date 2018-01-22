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
    
    init(name:String,model:String,company:String,Year:String ) {
        self.MobileName = name
        self.ModelName = model
        self.MnfgCompany = company
        self.MnfgYear = Year
    }
}

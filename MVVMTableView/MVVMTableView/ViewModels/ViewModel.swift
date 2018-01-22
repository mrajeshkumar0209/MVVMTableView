//
//  ViewModel.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 22/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    private var mobile: MobileModel

    init(mobile: MobileModel) {
        self.mobile = mobile
    }

    var modelName:String {
        return self.mobile.ModelName!
    }
    var mobileName:String {
        return self.mobile.MobileName!
    }
    var company:String {
        return self.mobile.MnfgCompany!
    }
    var mnfgYear:String {
        return self.mobile.MnfgYear!
    }
    
}

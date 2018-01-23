//
//  DetailsVC.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 23/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    
    var vmIndex:Int = 0
     let mobiles: [ViewModel] = (UIApplication.shared.delegate as! AppDelegate).mobiles
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = mobiles[vmIndex].mobileName + " " + mobiles[vmIndex].modelName
        //self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 20)!,NSAttributedStringKey.foregroundColor : UIColor.lightGray]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLbl.text = mobiles[vmIndex].mobileName
        modelLbl.text = mobiles[vmIndex].modelName
        companyLbl.text = mobiles[vmIndex].company
        yearLbl.text = mobiles[vmIndex].mnfgYear
        deviceImage.image = UIImage(named: mobiles[vmIndex].image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

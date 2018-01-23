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
    @IBOutlet weak var modelStaticLbl: UILabel!
    @IBOutlet weak var yearStaticLbl: UILabel!
   
    var vmIndex:Int = 0
    var selectedApp:NSDictionary = [:]
    var isApps:Bool = false
    let mobiles: [ViewModel] = (UIApplication.shared.delegate as! AppDelegate).mobiles

   

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if isApps {
            self.navigationItem.title = selectedApp.value(forKey: "name") as? String
            nameLbl.text = selectedApp.value(forKey: "name") as? String
            modelStaticLbl.text = "Copy right"
            modelLbl.text = selectedApp.value(forKey: "copyright") as? String
            companyLbl.text = selectedApp.value(forKey: "artistName") as? String
            yearStaticLbl.text = "Release Date"
            yearLbl.text = selectedApp.value(forKey: "releaseDate") as? String
          
            let imageString:String = selectedApp.value(forKey: "artworkUrl100") as! String
            let imageUrl = URL(string: imageString)
            DispatchQueue.global(qos: .userInitiated).async {
                
                let imageData:NSData = NSData(contentsOf: imageUrl!)!
                
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    
                   self.deviceImage.image = image
                }
            }
     
            
        }
        else
        {
            self.navigationItem.title = mobiles[vmIndex].mobileName + " " + mobiles[vmIndex].modelName
            nameLbl.text = mobiles[vmIndex].mobileName
            modelLbl.text = mobiles[vmIndex].modelName
            companyLbl.text = mobiles[vmIndex].company
            yearLbl.text = mobiles[vmIndex].mnfgYear
            deviceImage.image = UIImage(named: mobiles[vmIndex].image)
        }
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

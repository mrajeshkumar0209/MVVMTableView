//
//  ViewController.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 22/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var appViewModel:AppsViewModel!
    @IBOutlet weak var header: UIView!
    
    var isApps:Bool = false
    
    let mobiles: [ViewModel] = (UIApplication.shared.delegate as! AppDelegate).mobiles
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appViewModel.getApps {
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if switcher.isOn {
          self.navigationItem.title =  "TOP FREE iOS APPS"
            isApps = true
        }
        else
        {
           self.navigationItem.title = "Mobile Gallery"
            isApps = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: SWITCH Action
    @IBAction func switcherAction(_ sender: UISwitch) {
         if sender.isOn
         {
            isApps = true
            self.navigationItem.title =  "TOP FREE iOS APPS"
        }
        else
         {
           isApps = false
            self.navigationItem.title = "Mobile Gallery"
        }
        self.tableView.reloadData()

    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isApps {
            return appViewModel.numberOfItemsToDisplay(in: section)
        }
        else
        {
            return mobiles.count
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileCell", for: indexPath) as! MobileCell
        
        if isApps {
            
            cell.name?.text = appViewModel.appTitleToDisplay(for: indexPath)
            cell.model.text = ""
            cell.company?.text = appViewModel.appCompanyToDisplay(for: indexPath)
            cell.year?.text = appViewModel.appReleaseDateToDisplay(for: indexPath)
            
            let imageString:String = appViewModel.appIconToDisplay(for: indexPath)
            let imageUrl = URL(string: imageString)
            DispatchQueue.global(qos: .userInitiated).async {
                
                let imageData:NSData = NSData(contentsOf: imageUrl!)!
                
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
        
                    cell.deviceImage.image = image
                }
            }
            
        }
        else
        {
            let mobileViewModel = mobiles[indexPath.row]
            cell.name?.text = mobileViewModel.mobileName
            cell.model?.text = mobileViewModel.modelName
            cell.company?.text = mobileViewModel.company
            cell.year?.text = mobileViewModel.mnfgYear
            
            let imageString:String = mobileViewModel.image
            cell.deviceImage.image = UIImage(named:imageString)
        }
     
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        let myVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        myVC.vmIndex = indexPath.row
        myVC.selectedApp = appViewModel.appSelectedToDisplay(for: indexPath)
        if isApps {
            myVC.isApps = true
        }
        navigationController?.pushViewController(myVC, animated: true)
        
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

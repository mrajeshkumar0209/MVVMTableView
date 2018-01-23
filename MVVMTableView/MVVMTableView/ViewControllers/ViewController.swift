//
//  ViewController.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 22/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let mobiles: [ViewModel] = (UIApplication.shared.delegate as! AppDelegate).mobiles
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobiles.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileCell", for: indexPath) as! MobileCell
        let mobileViewModel = mobiles[indexPath.row]
        
        cell.name?.text = mobileViewModel.mobileName
        cell.model?.text = mobileViewModel.modelName
        cell.company?.text = mobileViewModel.company
        cell.year?.text = mobileViewModel.mnfgYear
        
        let imageString:String = mobileViewModel.image
        print(imageString)
        cell.deviceImage.image = UIImage(named:imageString)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        let myVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        myVC.vmIndex = indexPath.row
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

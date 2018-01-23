//
//  AppsViewModel.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 23/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class AppsViewModel: NSObject {
    @IBOutlet var apiClient: appsClient!
    
    var apps: [NSDictionary]?
    
    func getApps(completion: @escaping () -> Void) {
        
        apiClient.fetchApps { (arrayOfAppsDictionaries) in
            
            DispatchQueue.main.async {
                
                self.apps = arrayOfAppsDictionaries
                
                completion()
            }
        }
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return apps?.count ?? 0
    }
    func appTitleToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "name") as? String ?? ""
    }
    func appCompanyToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "artistName") as? String ?? ""
    }
    func appIconToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "artworkUrl100") as? String ?? ""
    }
    func appReleaseDateToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "releaseDate") as? String ?? ""
    }
    func appCopyRightToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "copyright") as? String ?? ""
    }
    func appSelectedToDisplay(for indexPath: IndexPath) -> NSDictionary {
        return (apps?[indexPath.row])! 
    }
    
    
    
    
    
}

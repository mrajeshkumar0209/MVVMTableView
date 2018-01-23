//
//  appsClient.swift
//  GithubTrends
//
//  Created by Rajeshkumar maddi on 12/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

class appsClient: NSObject {

    func fetchApps(completion: @escaping ([NSDictionary]?) -> ()) {
       // https://api.github.com/search/repositories?q=trending&order=desc
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/100/explicit.json")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data,response,error in
            //print("anything")
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    print(jsonResult)
                    if let apps = (jsonResult.value(forKeyPath: "feed") as? NSDictionary)?.value(forKey: "results")as! [NSDictionary]? {
                        completion(apps)
                        return
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}

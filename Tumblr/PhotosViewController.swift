//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by siddhant on 1/10/18.
//  Copyright © 2018 siddhant. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate {

    var posts: [[String: Any]] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                //print(dataDictionary)
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                // TODO: Get the posts and store in posts property
                
                // TODO: Reload the table view
            }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }

    
}

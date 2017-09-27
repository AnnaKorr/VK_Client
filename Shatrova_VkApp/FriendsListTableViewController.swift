//
//  FriendsListViewController.swift
//  Shatrova_VkApp
//
//  Created by apple on 27.09.17.
//  Copyright © 2017 Korona. All rights reserved.
//

import UIKit

class FriendsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let friendsBackgroundImage = UIImage(named: "friendsRectangle.png")
        let friendsBackgroundImageView = UIImageView(image: friendsBackgroundImage)
        tableView.backgroundView = friendsBackgroundImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

}

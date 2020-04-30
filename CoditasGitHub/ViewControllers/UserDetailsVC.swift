//
//  UserDetailsVC.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailsVC: UIViewController {
    
    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var repoUrlLabel: UITextView!
    
    var userData: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialize()
    }
    
    fileprivate func initialize() -> Void {
        self.title = "User Detail"
        
        viewProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        viewProfileButton.layer.borderWidth = 0.5
        viewProfileButton.layer.cornerRadius = 2
        
        nameLabel.text = userData?.login
        scoreLabel.text = "\(userData?.score ?? 0.0)"
        repoUrlLabel.text = userData?.html_url
        
        picImageView.layer.cornerRadius = picImageView.frame.size.height/2
        picImageView.kf.setImage(with: URL.init(string: userData?.avatar_url ?? ""))
    }
    
    @IBAction func viewProfileButtonAction(_ sender: UIButton) {
        if let url = URL(string: userData?.html_url ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

//
//  HomeVC.swift
//  CoditasGitHub
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resultCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Home"
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let showingText = NSMutableAttributedString.init(string: "Showing ", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ])
        
        let countText = NSAttributedString.init(string: "240", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
        
        let resultText = NSAttributedString.init(string: " results", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ])
        
        showingText.append(countText)
        showingText.append(resultText)
        
        resultCountLabel.attributedText = showingText
        
    }
    


}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        return cell
    }
    
}

//
//  SortByVC.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import UIKit

class SortByVC: UIViewController {
    
    @IBOutlet weak var nameAscButton: UIButton!
    @IBOutlet weak var nameDescButton: UIButton!
    @IBOutlet weak var rankUpButton: UIButton!
    @IBOutlet weak var rankDownButton: UIButton!
    
    var selectedSortIndex: Int?
    
    var completionHander: ((Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }

    fileprivate func initialize() {
        if let selectedSort = selectedSortIndex {
            if selectedSort == 1 {
                nameAscButton.setTitleColor(.blue, for: .normal)
                nameDescButton.setTitleColor(.darkGray, for: .normal)
                rankUpButton.setTitleColor(.darkGray, for: .normal)
                rankDownButton.setTitleColor(.darkGray, for: .normal)
            } else if selectedSort == 2 {
                nameAscButton.setTitleColor(.darkGray, for: .normal)
                nameDescButton.setTitleColor(.blue, for: .normal)
                rankUpButton.setTitleColor(.darkGray, for: .normal)
                rankDownButton.setTitleColor(.darkGray, for: .normal)
            } else if selectedSort == 3 {
                nameAscButton.setTitleColor(.darkGray, for: .normal)
                nameDescButton.setTitleColor(.darkGray, for: .normal)
                rankUpButton.setTitleColor(.blue, for: .normal)
                rankDownButton.setTitleColor(.darkGray, for: .normal)
            } else if selectedSort == 4 {
                nameAscButton.setTitleColor(.darkGray, for: .normal)
                nameDescButton.setTitleColor(.darkGray, for: .normal)
                rankUpButton.setTitleColor(.darkGray, for: .normal)
                rankDownButton.setTitleColor(.blue, for: .normal)
            }
        } else {
            nameAscButton.setTitleColor(.darkGray, for: .normal)
            nameDescButton.setTitleColor(.darkGray, for: .normal)
            rankUpButton.setTitleColor(.darkGray, for: .normal)
            rankDownButton.setTitleColor(.darkGray, for: .normal)
        }
        
    }
    
    @IBAction func CloseButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SortButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.completionHander?(sender.tag)
        }
    }
    
    
}

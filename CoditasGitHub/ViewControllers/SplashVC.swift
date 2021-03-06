//
//  SplashVC.swift
//  CoditasGitHub
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchUserVC") as! SearchUserVC
            let nav = UINavigationController.init(rootViewController: vc)
            nav.navigationBar.barTintColor = .blue
            nav.navigationBar.tintColor = .white
            nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            nav.modalPresentationStyle = .fullScreen
            
            self.present(nav, animated: true, completion: nil)
        }
    }
    
}

//
//  SearchUserVC.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import UIKit
import Kingfisher

class SearchUserVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableTopHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sortTitleLabel: UILabel!
    @IBOutlet weak var sortImageView: UIImageView!
    @IBOutlet weak var resultCountLabel: UILabel!
    
    var selectedSortIndex: Int?
    var searchDataArray: [UserData]?
    
    let latoRegularFont = UIFont.init(name: "Lato-Regular", size: 13)
    let sytemRegularFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Home"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
    }
    
    fileprivate func initialize() -> Void {
        
        searchBar.delegate = self
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableTopHeightConstraint.constant = 0
        
        reloadSortTitle()
        reloadResultTitle()
    }
    
    
    fileprivate func reloadResultTitle() -> Void {
        let searchResultTextAtt = NSMutableAttributedString.init(string: "Search Results for ", attributes: [
            NSAttributedString.Key.font: latoRegularFont ?? sytemRegularFont,
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ])
        
        let searchTextAtt = NSAttributedString.init(string: "'\(searchBar.text ?? "")'", attributes: [
            NSAttributedString.Key.font: latoRegularFont ?? sytemRegularFont,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
        
        searchResultTextAtt.append(searchTextAtt)
        
        resultCountLabel.attributedText = searchResultTextAtt
        
    }
    
    fileprivate func reloadSortTitle() -> Void {
        
        let sortBy = NSMutableAttributedString.init(string: "Sort By", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ])
        
        if let selectedSort = selectedSortIndex {
            if selectedSort == 1 {
                let filterName = NSMutableAttributedString.init(string: " Name (A - Z)", attributes: [
                    NSAttributedString.Key.font: latoRegularFont ?? sytemRegularFont,
                    NSAttributedString.Key.foregroundColor: UIColor.darkGray
                ])
                sortBy.append(filterName)
                sortTitleLabel.attributedText = sortBy
                sortImageView.image = #imageLiteral(resourceName: "sort")
            } else if selectedSort == 2 {
                let filterName = NSMutableAttributedString.init(string: " Name (Z - A)", attributes: [
                    NSAttributedString.Key.font: latoRegularFont ?? sytemRegularFont,
                    NSAttributedString.Key.foregroundColor: UIColor.darkGray
                ])
                sortBy.append(filterName)
                sortTitleLabel.attributedText = sortBy
                sortImageView.image = #imageLiteral(resourceName: "sort")
            } else if selectedSort == 3 {
                let filterName = NSMutableAttributedString.init(string: " Rank ", attributes: [
                    NSAttributedString.Key.font: latoRegularFont ?? sytemRegularFont,
                    NSAttributedString.Key.foregroundColor: UIColor.darkGray
                ])
                sortBy.append(filterName)
                sortTitleLabel.attributedText = sortBy
                sortImageView.image = #imageLiteral(resourceName: "up-arrow")
            } else if selectedSort == 4 {
                let filterName = NSMutableAttributedString.init(string: " Rank ", attributes: [
                    NSAttributedString.Key.font: latoRegularFont ?? sytemRegularFont,
                    NSAttributedString.Key.foregroundColor: UIColor.darkGray
                ])
                sortBy.append(filterName)
                sortTitleLabel.attributedText = sortBy
                sortImageView.image = #imageLiteral(resourceName: "down-arrow")
            }
        } else {
            sortTitleLabel.attributedText = sortBy
            sortImageView.image = #imageLiteral(resourceName: "sort")
        }
    }
    
    fileprivate func sortList() -> Void {
        if let selectedSort = selectedSortIndex {
            if selectedSort == 1 {
                // Asce
                self.searchDataArray?.sort { $0.login.lowercased() < $1.login.lowercased() }
            } else if selectedSort == 2 {
                // Desc
                self.searchDataArray?.sort { $0.login.lowercased() > $1.login.lowercased() }
            } else if selectedSort == 3 {
                // Rank Up
                self.searchDataArray?.sort { $0.id > $1.id }
            } else if selectedSort == 4 {
                // Rank Down
                self.searchDataArray?.sort { $0.id < $1.id }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func SortButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SortByVC") as! SortByVC
        vc.selectedSortIndex = self.selectedSortIndex
        vc.completionHander = { index in
            self.selectedSortIndex = index
            self.reloadSortTitle()
            self.sortList()
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    fileprivate func searchUser(with name: String) -> Void {
        DispatchQueue.global().async {
            APIClient.getData(apiName: APIConstant.SEARCH_URL+name, headers: nil) { (status, response) in
                if status {
                    if let data = response as? [String: Any] {
                        self.searchDataArray = nil
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                            let responseData = try JSONDecoder().decode(Response.self, from: jsonData)
                            self.searchDataArray = responseData.userData
                        } catch {
                            print(error.localizedDescription)
                        }

                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.searchDataArray = nil
                            self.tableView.reloadData()
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.searchDataArray = nil
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    
}   // class end

extension SearchUserVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchBar.text?.isEmpty ?? true) {
            tableTopHeightConstraint.constant = 0
        } else {
            tableTopHeightConstraint.constant = 85
        }
        return searchDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        let searchData = searchDataArray?[indexPath.row]
        
        cell.nameLabel.text = searchData?.login
        cell.scoreLabel.text = "\(searchData?.score ?? 0.0)"
        
        cell.picImageView.kf.indicatorType = .activity
        cell.picImageView.kf.setImage(with: URL.init(string: searchData?.avatar_url ?? ""))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsVC
        vc.userData = searchDataArray?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension SearchUserVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadResultTitle()
        searchUser(with: searchText)
    }

}

//
//  Constants.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import Foundation
import UIKit


// MARK:- Application Constants
struct Constant {
    
    static let PROJECT_NAME: String = "LegalNextt"
    static let SOMETHING_WENT_WRONG: String = "Something went wrong, Please try again"
    static let OK = "OK"
    static let CANCEL = "Cancel"
    static let YES = "Yes"
    static let NO = "No"
    static let NO_INTERNET = "No internet connection. Please try again."
    static let INVALID_URL = "Invalid URL"
    
}

struct StoryBoards {
    static let MAIN = UIStoryboard.init(name: "Main", bundle: nil)
}

// MARK:- API Constant
struct APIConstant {
    
    /** URL of the server */
    static let BASE_URL = "https://api.github.com/"
    
    static let SEARCH_URL = "https://api.github.com/search/users?q="
}

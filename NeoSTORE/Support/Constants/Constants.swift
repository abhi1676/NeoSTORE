//
//  Constants.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import Foundation
struct Constants{
    
    //identifier,nibName,array
    //MARK: - textField
    static let username = "Username"
    static let  password = "Password"
    static let firstname = "First Name"
    static let lastname = "Last Name"
    static let email = "Email"
    static let phonenumber = "Phone Number"
    static let confirmpassword = "Confirm Password"
    
    //MARK: - Icon
    static let usernameIcon = "username_icon"
    static let passwordIcon = "password_icon"
    static let phonenumberIcon = "cellphone"
    static let emailIcon = "email_icon"
    static let checkIcon = "check_icon"
    static let uncheckIcon = "uncheck_icon"
    static let checkYes = "chky"
    static let checkNo = "chkn"
    
    //MARK: - API HELPERS
    
    static let get = "GET"
    static let post = "POST"
    static let baseURL = "http://staging.php-dev.in:8844/trainingapp/api/"
    static let register = "users/login"
    static let login = "users/register"
    static let accessToken = "accessToken"
    static let httpHeaderField = "Content-Type"
    static let applicationOrJson = "application/json"
    static let accept = "Accept"
    //MARK: - ERROR MESSAGES
    static let userNotFound = "No user data found."
    static let requestModelFailure = "Failed to encode request model"
    
}





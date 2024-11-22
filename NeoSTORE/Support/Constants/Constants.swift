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
    static let termsAndConditions = "Terms & Conditions"
    
    //MARK: - Icon
    static let usernameIcon = "username_icon"
    static let passwordIcon = "password_icon"
    static let phonenumberIcon = "cellphone"
    static let emailIcon = "email_icon"
    static let checkIcon = "check_icon"
    static let uncheckIcon = "uncheck_icon"
    static let checkYes = "chky"
    static let checkNo = "chkn"
    static let menuIcon = "menu_icon"
    static let searchIcon = "search_icon"
    //MARK: - API HELPERS
    
    static let get = "GET"
    static let post = "POST"
    static let baseURL = "http://staging.php-dev.in:8844/trainingapp/api/"
    static let login = "users/login"
    static let register = "users/register"
    static let products = "products/getList"
    static let productDeatil = "products/getDetail"
    static let cart = "cart"
    static let addToCart = "addToCart"
    static let editCart = "editCart"
    static let deleteCart = "deleteCart"
    static let order = "order"
    static let orderList = "orderList"
    
    static let getuserData = "users/getUserData"
    static let updateData = "users/update"
    static let setRating = "products/setRating"
    static let accessToken = "accessToken"
    static let httpHeaderField = "Content-Type"
    static let applicationOrJson = "application/json"
    static let applicationOrFormURLEndcoded = "application/x-www-form-urlencoded"
    static let authorization = "Authorization"
    
    //MARK: - ERROR MESSAGES
    static let userNotFound = "No user data found."
    static let requestModelFailure = "Failed to encode request model"
    static let invalidFirstName = "Invalid first name"
    static let invalidLastName = "Invalid Last Name"
    static let invalidPhonenumber = "Invalid phone number"
    static let passwordNotMatching = "Passwords do not match"
    static let invalidEmail = "Invalid email address"
    static let error = "Error"
    static let noUserData = "No user data returned"
    
    
    //MARK: - HELPERS
    static let accept = "Accept"
    static let registartionComplete = "Registration Complete"
    static let userRegistered = "User Registered SuccessFully"
    static let validationError = "Please fill Valid Details"
    static let loginSuccess = "LOGIN SUCCESSFULL"
    static let loginFailed = "LOGIN FAILED"
    static let invalidCredentials = "INVALID CREDENTIALS"
    static let welcomBack = "WELCOME BACK"
    static let male = "M"
    static let female = "F"
    static let fullname = "fullname"
    
}





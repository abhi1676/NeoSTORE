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
    static let currentPassword = "Current Password"
    static let newPassword = "New Password"
    
    
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
    static let orderDetail = "orderDetail"
    
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
    static let addressError = "Address cannot be empty"
    
    
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
    static let cityArray = [
        ("Mumbai", 19.0760, 72.8777, "9th floor, Business arcade, Sayani Rd, Parel Bus Depot, Dighe Nagar, Prabhadevi, Mumbai, Maharashtra 400025"),
        ("Pune", 18.5204, 73.8567, "NTPL SEZ (Blueridge), IT-08/09, 10th Floor, Hinjewadi Phase 1 Rd, Hinjawadi Rajiv Gandhi Infotech Park, Hinjawadi, Pune, Maharashtra 411057"),
        ("Sangli", 16.8600, 74.5670, "Address: DEF Street, Sangli"),
        ("Delhi", 28.6139, 77.2090, "IIIrd Floor, 76A, J&K Block, Block J & K, Laxmi Nagar, Delhi, 110092"),
        ("Navi Mumbai", 19.0330, 73.0297, "Unit No 501, Sigma IT Park, Plot No R-203,204, Midc TTC Industrial Area. Rabale, Navi Mumbai, Maharashtra 400701"),
        ("Ahmedabad", 23.0225, 72.5714, "5th floor, E, The Address House, Westgate, Sarkhej - Gandhinagar Hwy, near YMCA Club, Truevalue, Makarba, Ahmedabad, Gujarat 380015")
    ]
    
    
    //MARK: - Storyboard Constants
    static let OrderDetailViewController = "OrderDetailViewController"
    static let editProfileViewController = "EditProfileViewController"
    static let resetPasswordViewController = "ResetPasswordViewController"
    static let addressViewController = "AddressViewController"
    static let addressListViewController = "AddressListViewController"
    static let CartViewController = "CartViewController"
    static let productDetailViewController = "ProductDetailViewController"
    static let OrderScreen = "OrderScreen"
    static let AccountScreen = "AccountScreen"
    static let HomeScreen = "HomeScreen"
    
    //MARK: - TableViewCell Constants
    static let OrderDetailTableViewCell = "OrderDetailTableViewCell"
    static let OrderListTableViewCell = "OrderListTableViewCell"
    static let addressListTableViewCell = "AddressListTableViewCell"
    static let cartTableViewCell = "CartTableViewCell"
    static let productsTableViewCell = "ProductsTableViewCell"
}





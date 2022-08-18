//
//  AuthViewController.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 17/8/2022.
//

import UIKit

class AuthViewController: UIViewController {

    
    private let authDAO: AuthDAO = AuthRemoteDAO()

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (username == nil || password == nil) {
            print("Input error")
        }
        
        authDAO.login(username: username!, password: password!) { response, error in
            if (error != nil) {
                print(error?.message)
            } else {
                self.storeSensitiveInfo(response!)
                self.goToHomeViewController()
            }
        }
    }
    
    private func storeSensitiveInfo(_ data: LoginResponse) {
        let keychain = KeychainUtils.instance()
        keychain.store(key: "access_token", value: data.access_token)
    }
    
    
    
    private func goToHomeViewController() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "homeVC")
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

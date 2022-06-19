//
//  LoginViewController.swift
//  currentNews
//
//  Created by emil kurbanov on 11.06.2022.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    let signinView = SignInView()

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user = User()
    var router: LaunchRouter?
    private let authRealm = AuthRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = signinView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        router = LaunchRouter(viewController: self)
    }
   
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    private func loginButtonTapped() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else { return }
        if login.isEmpty || password.isEmpty {
            router?.makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
            //  makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
        } else {
            user.login = login
            user.password = password
            if authRealm.searchLogin(User(login: login, password: password)) {
                router?.toNewsViewController()
            } else {
                router?.makeAlert(title: "Неверный логин или пароль", message: "Повторите попытку")
                //makeAlert(title: "Неверный логин или пароль", message: "Повторите попытку")
            }
        }
    }
    
    private func signUpButtonTapped() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else { return }
        
        if login.isEmpty || password.isEmpty {
            router?.makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
            //makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
        } else if authRealm.searchLogin(User(login: login, password: password)) {
            router?.makeAlert(title: "Такой пользователь уже существует", message: "Проверьте данные или зарегистрируйтесь заново!")
            //makeAlert(title: "Такой пользователь уже существует", message: "Проверьте данные или зарегистрируйтесь заново!")
        } else {
            user.login = login
            user.password = password
            
            authRealm.addUser(User(login: login, password: password))
            
            }
                router?.toNewsViewController()
            }
        
    
    
    @IBAction func logInAction(_ sender: Any) {
        loginButtonTapped()
    }
    @IBAction func signUpAction(_ sender: Any) {
        signUpButtonTapped()
    }
    
}


//
//  LoginViewController.swift
//  currentNews
//
//  Created by emil kurbanov on 11.06.2022.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    private lazy var signinView = AuthView()
    
    var user = User()
    var router: LaunchRouter?
    private let authRealm = AuthRealm()
    
    override func loadView() {
        view = signinView
        setButtonAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        router = LaunchRouter(viewController: self)
    }
   
    private func setButtonAction() {
        signinView.goButtonHandler = signinView.isAccountExist
        ? loginButtonTapped.self
        : signUpButtonTapped.self
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    private func loginButtonTapped(loginTextField: String?, passwordTextField: String?) {
        guard
            let login = loginTextField,
            let password = passwordTextField
        else { return }
        if login.isEmpty || password.isEmpty {
            router?.makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
            //  makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
        } else {
            user.login = login
            user.password = password
            if authRealm.searchLogin(User(login: login, password: password)) {
                // TODO: Router without segue
//                router?.toNewsViewController()
            } else {
                router?.makeAlert(title: "Неверный логин или пароль", message: "Повторите попытку")
                //makeAlert(title: "Неверный логин или пароль", message: "Повторите попытку")
            }
        }
    }
    
    private func signUpButtonTapped(loginTextField: String?, passwordTextField: String?) {
        guard
            let login = loginTextField,
            let password = passwordTextField
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
        // TODO: Router without segue
//                router?.toNewsViewController()
            }
}


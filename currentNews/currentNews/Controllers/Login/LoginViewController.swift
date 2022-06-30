//
//  LoginViewController.swift
//  currentNews
//
//  Created by emil kurbanov on 11.06.2022.
//

import UIKit
import RealmSwift

final class LoginViewController: UIViewController {
    
    private lazy var signinView = AuthView()
    
    private var user = User()
    private var router: LaunchRouter?
    private let authRealm = AuthRealm()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = signinView
        setButtonAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reSetupButton), name:  NSNotification.Name(rawValue: "ReSetUpButton"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        router = LaunchRouter(viewController: self)
    }
    
    // MARK: - Private Methods
   
    private func setButtonAction() {
        signinView.goButtonHandler = signinView.isAccountExist
        ? signUpButtonTapped.self
        : loginButtonTapped.self
    }
    
    @objc private func reSetupButton() {
        setButtonAction()
    }
    
    private func loginButtonTapped(loginTextField: String?, passwordTextField: String?) {
        guard
            let login = loginTextField,
            let password = passwordTextField
        else { return }
        if login.isEmpty || password.isEmpty {
            router?.makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
        } else {
            user = User(login: login, password: password)
            if authRealm.searchLogin(User(login: login, password: password)) {
                router?.toNewsViewController()
            } else {
                router?.makeAlert(title: "Неверный логин или пароль", message: "Повторите попытку")
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
        } else if authRealm.searchLogin(User(login: login, password: password)) {
            router?.makeAlert(title: "Такой пользователь уже существует", message: "Проверьте данные или зарегистрируйтесь заново!")
        } else {
            user = User(login: login, password: password)
            authRealm.addUser(user)
            router?.toNewsViewController()
        }
    }
}


//
//  LoginViewController.swift
//  currentNews
//
//  Created by emil kurbanov on 11.06.2022.
//

import UIKit
import RealmSwift
class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var realmUser: Results<User>?
    var user = User()
    let realm = try! Realm()
    var router: LaunchRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        router = LaunchRouter(viewController: self)
        realmUser = realm.objects(User.self)
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
            makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
        } else {
            user.login = login
            user.password = password
            if realm.object(ofType: User.self, forPrimaryKey: "\(login)") != nil {
                router?.toNewsViewController()
            } else {
                makeAlert(title: "Неверный логин или пароль", message: "Повторите попытку")
            }
        }
    }
    
    private func signUpButtonTapped() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else { return }
        
        if login.isEmpty || password.isEmpty {
            makeAlert(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля")
        } else {
            user.login = login
            user.password = password
            
            if realm.object(ofType: User.self, forPrimaryKey: "\(login)") != nil {
                makeAlert(title: "Такой пользователь уже существует", message: "Проверьте данные или зарегистрируйтесь заново!")
            } else {
                try! realm.write {
                    realm.add(user)
                }
                router?.toNewsViewController()
            }
        }
    }
    
    @IBAction func logInAction(_ sender: Any) {
        loginButtonTapped()
    }
    @IBAction func signUpAction(_ sender: Any) {
        signUpButtonTapped()
    }
    
}


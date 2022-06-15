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
    
    var realmUser: Results<Users>?
    var user = Users()
    let realm = try! Realm()
    
    override func viewWillAppear(_ animated: Bool) {
        realmUser = realm.objects(Users.self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func loginButtonTapped() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else { return }
        if login.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true, completion: nil)
        } else {
            user.login = login
            user.password = password
            if realm.object(ofType: Users.self, forPrimaryKey: "\(login)") != nil {
                performSegue(withIdentifier: "showNews", sender: self)
            } else {
                let alert = UIAlertController(title: "Неверный логин или пароль", message: "Повторите попытку", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func signUpButtonTapped() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else { return }
        
        if login.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Введите логин и пароль", message: "Пожалуйста, заполните все поля", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
        } else {
            user.login = login
            user.password = password
            
            if realm.object(ofType: Users.self, forPrimaryKey: "\(login)") != nil {
                let alert = UIAlertController(title: "Такой пользователь уже существует", message: "Проверьте данные или зарегистрируйтесь заново!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                present(alert, animated: true)
            } else {
                try! realm.write {
                    realm.add(user)
                }
                performSegue(withIdentifier: "showNews", sender: self)
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


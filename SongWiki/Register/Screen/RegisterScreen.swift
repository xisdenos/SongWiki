//
//  RegisterScreen.swift
//  SongWiki
//
//  Created by Franklin  Stilhano on 8/24/22.
//

import UIKit

class RegisterScreen: UIView {

    lazy var gradient: UIView =  {
        let view = GradientView(colors: [UIColor.systemPurple.cgColor, UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1).cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mello")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameTextField:UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 10
        tx.autocorrectionType = .no
        tx.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tx.keyboardType = .emailAddress
        tx.borderStyle = .roundedRect
        tx.attributedPlaceholder = NSAttributedString(string: "Digite seu Nome:", attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)])

        return tx
    }()
    
    lazy var emailTextField:UITextField = {
        let tx = CustomTF(placeholder: "Digite seu E-mail:", isSecure: false)
        return tx
    }()
    
    lazy var passwordTextField:UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 10
        tx.placeholder = "Digite sua senha:"
        tx.autocorrectionType = .no
        tx.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tx.keyboardType = .default
        tx.borderStyle = .roundedRect
        tx.isSecureTextEntry = true
        return tx
    }()
    
    lazy var checkPasswordTextField:UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 10
        tx.placeholder = "Digite novamente sua senha:"
        tx.autocorrectionType = .no
        tx.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tx.keyboardType = .default
        tx.borderStyle = .roundedRect
        tx.isSecureTextEntry = true
        return tx
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    func configSuperView(){
        self.addSubview(gradient)
        self.addSubview(iconImage)
        self.addSubview(nameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(checkPasswordTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.gradient.topAnchor.constraint(equalTo: self.topAnchor),
            self.gradient.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.gradient.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            self.iconImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30),
            self.iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: -10),
            self.iconImage.heightAnchor.constraint(equalToConstant: 130),
            self.iconImage.widthAnchor.constraint(equalToConstant: 130),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.iconImage.bottomAnchor,constant: 20),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor,constant: 15),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.checkPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,constant:15),
            self.checkPasswordTextField.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.checkPasswordTextField.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.checkPasswordTextField.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            
            
            
            
            
            
            
    
            
            
            
        
        
        
        
        ])
    }
}

//
//  ForgottenPasswordView.swift
//  SongWiki
//
//  Created by Lucas Pinto on 24/08/22.
//

import Foundation
import UIKit

class ForgottenPasswordView: UIView {
    
    lazy var gradient: GradientView = {
        let gradient = GradientView(colors: [UIColor.systemPurple.cgColor, UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1).cgColor])
        gradient.translatesAutoresizingMaskIntoConstraints = false
        return gradient
    }()
    
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var forgottenTextField: UITextField = {
        let tf = CustomTF(placeholder: "Email de recuperação", isSecure: false)
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var forgottenButton: UIButton = {
        let button = AuthButton(placeholder: "Esqueci a senha")
        button.isEnabled = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicionando acao do botaoo ---------------------
//        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.gradient)
        self.addSubview(self.iconImage)
        self.addSubview(self.forgottenTextField)
        self.addSubview(self.forgottenButton)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.gradient.topAnchor.constraint(equalTo: self.topAnchor),
            self.gradient.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.gradient.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            self.iconImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            self.iconImage.widthAnchor.constraint(equalToConstant: 150),
            self.iconImage.heightAnchor.constraint(equalToConstant: 150),
            
            self.forgottenTextField.topAnchor.constraint(equalTo: self.iconImage.bottomAnchor, constant: 20),
            self.forgottenTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.forgottenTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            self.forgottenTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.forgottenButton.topAnchor.constraint(equalTo: self.forgottenTextField.bottomAnchor, constant: 20),
            self.forgottenButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.forgottenButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            self.forgottenButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

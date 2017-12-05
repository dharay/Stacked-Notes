
import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    var theStack = UIStackView()
    var loginTextBox = UITextField()
    var passwordTextBox = UITextField()
    var loginButton = UIButton(type: UIButtonType.roundedRect)
    var rememberMeStack = UIStackView()
    var rememberMeLabel = UILabel()
    var rememberMeSwitch = UISwitch()
    var uiHeight:CGFloat = 31
    
    var staticConstraints = [NSLayoutConstraint]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpStackView()
        
    }
    
    func setUpStackView(){
        
        theStack = UIStackView(arrangedSubviews: [loginTextBox , passwordTextBox, loginButton])
        rememberMeStack = UIStackView(arrangedSubviews: [rememberMeSwitch,rememberMeLabel])
        theStack.translatesAutoresizingMaskIntoConstraints = false
        rememberMeStack.translatesAutoresizingMaskIntoConstraints = false
        theStack.axis = .vertical
        theStack.distribution  = UIStackViewDistribution.equalSpacing
        theStack.alignment = UIStackViewAlignment.fill
        theStack.spacing   = 16.0
        staticConstraints.append(theStack.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6))
        rememberMeStack.axis = .horizontal
        rememberMeStack.distribution  = UIStackViewDistribution.equalSpacing
        rememberMeStack.alignment = UIStackViewAlignment.center
        rememberMeStack.spacing   = 16.0
        rememberMeStack.backgroundColor = .orange
        
        loginTextBox.placeholder = "username"
        staticConstraints.append(loginTextBox.heightAnchor.constraint(equalToConstant: uiHeight))
        loginTextBox.borderStyle = .roundedRect
        loginTextBox.delegate = self
        loginTextBox.autocapitalizationType = .none
        
        passwordTextBox.placeholder = "password"
        staticConstraints.append(passwordTextBox.heightAnchor.constraint(equalToConstant: uiHeight))
        passwordTextBox.borderStyle = .roundedRect
        passwordTextBox.isSecureTextEntry = true
        passwordTextBox.delegate = self
        passwordTextBox.isSecureTextEntry = true
        
        staticConstraints.append(loginButton.heightAnchor.constraint(equalToConstant: uiHeight))
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.backgroundColor = UIColor.green
        loginButton.setTitle("Log In", for: .normal)
        loginButton.tag = 1
        
        staticConstraints.append(rememberMeStack.heightAnchor.constraint(equalToConstant: uiHeight))
        staticConstraints.append(rememberMeLabel.heightAnchor.constraint(equalToConstant: uiHeight))
        rememberMeLabel.text = "remember credentials?"
        rememberMeLabel.adjustsFontSizeToFitWidth = true
        rememberMeLabel.textAlignment = .right
        
        theStack.addArrangedSubview(rememberMeStack)
        self.view.addSubview(theStack)
        
        staticConstraints.append(theStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        staticConstraints.append(theStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor))
        NSLayoutConstraint.activate(staticConstraints)
      
    }

    
    @objc func login(){
        if loginTextBox.text == "" || passwordTextBox.text == "" {
            print("Alert")
            return
        }
        if accounts.keys.contains(loginTextBox.text!) {
            if accounts[loginTextBox.text!] == passwordTextBox.text {
                let next = self.storyboard?.instantiateViewController(withIdentifier: "notesNav")
                self.present(next!, animated: true, completion: nil)
                return
            }
            print("Alert invalid password")
            return
        }
        print("Alert invalid username")
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

}

//
//  InputTextFieldContainer.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 26/03/2023.
//

import Foundation
import UIKit

class InputTextFieldContainer: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    let toolBar = UIToolbar()
    var inputType: InputType?
    var doneAction: ((String, InputType) -> Void)?
    var textChanged: ((String, InputType) -> Void)?
    var inputText: String = ""
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setUpUI()
    }
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    private func setUpUI() {
        backgroundView.layer.borderColor = UIColor.black.cgColor
        backgroundView.layer.borderWidth = 1.0
        backgroundView.layer.cornerRadius = 15
        
        inputTextField.borderStyle = .none
        inputTextField.delegate = self
        inputTextField.keyboardType = .default
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.sizeToFit()
        
        doneButton.tintColor = .black
        toolBar.items = [doneButton, flexibleSpace]
        toolBar.barTintColor = .white
        toolBar.layer.cornerRadius = 30
        toolBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        toolBar.layer.masksToBounds = true
        inputTextField.inputAccessoryView = toolBar
    }
    
    public func setUpTextField(type: InputType) {
        
        switch type {
        case .email, .fullName:
            inputTextField.autocorrectionType = .no
        case .password, .confirmPassword:
            inputTextField.isSecureTextEntry = true
            inputTextField.autocorrectionType = .no
        case .phoneNumber:
            inputTextField.keyboardType = .phonePad
        default:
            break
        }
        
        self.inputType = type
        inputTextField.placeholder = type.titleLabel.lowercased()
        titleLabel.text = type.titleLabel
    }
    
    @objc func doneButtonTapped() {
        inputTextField.resignFirstResponder()
        guard let type = self.inputType else { return }
        doneAction?(self.inputText, type)
    }
    
    func handleDoneAction(completion: @escaping(String, InputType) -> Void) {
        self.doneAction = completion
    }
    
    func handleTextChanged(completion: @escaping(String, InputType) -> Void) {
        self.textChanged = completion
    }
    
}

extension InputTextFieldContainer: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.inputText = textField.text ?? ""
        self.textChanged?(textField.text ?? "", self.inputType ?? .none)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.inputText = textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch inputType {
        case .phoneNumber:
            let maxLength = 11
            let currentString = (textField.text ?? "") as NSString
            let newString = currentString.replacingCharacters(in: range, with: string)
            return newString.count <= maxLength
        default:
            return true
        }
    }
}

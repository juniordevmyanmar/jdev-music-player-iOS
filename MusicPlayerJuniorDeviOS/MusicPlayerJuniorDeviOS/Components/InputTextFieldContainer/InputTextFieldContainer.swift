//
//  InputTextFieldContainer.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 26/03/2023.
//

import Foundation
import UIKit

class InputTextFieldContainer: UIView {
    
    @IBOutlet weak var inputTextBackgroundView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    let toolBar = UIToolbar()
    var inputType: InputType?
    var doneAction: ((String, InputType) -> Void)?
    var textChanged: ((String, InputType) -> Void)?
    var didChooseDate: ((String) -> Void)?
    var inputText: String = ""
    var datePicker: UIDatePicker?
    
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
        inputTextBackgroundView.backgroundColor = .textColor
        inputTextBackgroundView.layer.cornerRadius = 4
        inputTextBackgroundView.layer.masksToBounds = true
        inputTextField.delegate = self
        inputTextField.borderStyle = .none
        inputTextField.textColor = .controlButton
        inputTextField.font = .raleWay700(ofSize: 16)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.sizeToFit()
        
        doneButton.tintColor = .black
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.barTintColor = .white
        toolBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        toolBar.layer.masksToBounds = true
        toolBar.layer.cornerRadius = 30
        inputTextField.inputAccessoryView = toolBar
    }
    
    public func setUpTextFieldType(type: InputType) {
        self.inputType = type
        inputTextField.placeholder = type.titleLabel.lowercased()
        
        switch type {
        case .phoneNumber:
            inputTextField.keyboardType = .phonePad
        case .dateOfBirth:
            self.configureDatePicker(textField: inputTextField)
        default:
            break
        }
    }
    
    @objc func doneButtonTapped() {
        inputTextField.resignFirstResponder()
        guard let type = self.inputType else { return }
        doneAction?(self.inputTextField.text ?? "", type)
    }
    
    private func configureDatePicker(textField: UITextField) {
        let dropDown = UIImageView(image: UIImage(named: "date"))
        let stackView = UIStackView(arrangedSubviews: [dropDown])
        stackView.isUserInteractionEnabled = false
        dropDown.contentMode = .center
        dropDown.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dropDown.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        var rightView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: textField.frame.height))
        rightView = stackView
        
        textField.rightView = rightView
        textField.rightViewMode = .always
        
        createDatePicker(textField: textField)
    }
    
    func createDatePicker(textField: UITextField) {
        datePicker = UIDatePicker()
        datePicker?.date = Date()
        datePicker?.maximumDate = Date()
        datePicker?.locale = Locale.init(identifier: "en_US")
        datePicker?.datePickerMode = .date
        textField.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        datePicker?.backgroundColor = .white
        datePicker?.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
    }
    
    @objc func handleDateSelection() {
        guard let picker = datePicker else { return }
        inputTextField.text = picker.date.toString
        self.didChooseDate?(picker.date.toString)
    }
    
    func handleDoneAction(completion: @escaping(String, InputType) -> Void) {
        self.doneAction = completion
    }
    
    func handleTextChanged(completion: @escaping(String, InputType) -> Void) {
        self.textChanged = completion
    }
    
    func handleDatePickAction(completion: @escaping(String) -> Void) {
        self.didChooseDate = completion
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

//
//  LoginAuthenticationCell.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 28/03/2023.
//

import UIKit

class LoginAuthenticationCell: BaseTableViewCell<InputFormField> {
    
    @IBOutlet weak var inputContainerView: InputTextFieldContainer!
    var doneAction: ((String, InputType, Int) -> Void)?
    var textChanged: ((String, InputType, Int) -> Void)?
    var didChooseDate: ((String) -> Void)?
    var row: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func bindItem(_ item: InputFormField) {
        super.bindItem(item)
        
        self.inputContainerView.inputTextField.text = item.text
        self.inputContainerView.inputTextField.isSecureTextEntry = item.isSecureText
        self.inputContainerView.setUpTextFieldType(type: item.inputType)
        inputContainerView.handleDoneAction { self.doneAction?($0, $1, self.row ?? 0) }
        inputContainerView.handleTextChanged { self.doneAction?($0, $1, self.row ?? 0) }
        inputContainerView.handleDatePickAction { self.didChooseDate?($0) }
    }
    
    override func setUpUI() {
        super.setUpUI()
    }
    
    func handleDoneAction(completion: @escaping(String, InputType, Int) -> Void) {
        self.doneAction = completion
    }
    
    func handleTextChanged(completion: @escaping(String, InputType, Int) -> Void) {
        self.textChanged = completion
    }
    
    func handleDateSelction(completion: @escaping(String) -> Void) {
        self.didChooseDate = completion
    }
    
}

//
//  LoginAuthenticationCell.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 28/03/2023.
//

import UIKit

class LoginAuthenticationCell: BaseTableViewCell<InputType> {
    
    @IBOutlet weak var inputContainerView: InputTextFieldContainer!
    var doneAction: ((String, InputType) -> Void)?
    var textChanged: ((String, InputType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func bindItem(_ item: InputType) {
        super.bindItem(item)
        self.inputContainerView.setUpTextField(type: item)
        
        inputContainerView.handleDoneAction { self.doneAction?($0, $1) }
        inputContainerView.handleTextChanged { self.textChanged?($0, $1) }
    }
    
    override func setUpUI() {
        super.setUpUI()
    }
    
    func handleDoneAction(completion: @escaping(String, InputType) -> Void) {
        self.doneAction = completion
    }
    
    func handleTextChanged(completion: @escaping(String, InputType) -> Void) {
        self.textChanged = completion
    }
    
    
}

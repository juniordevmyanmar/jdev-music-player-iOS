//
//  BaseTableViewCell.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import UIKit

class BaseTableViewCell<T: Any>: UITableViewCell {
    
    var item: T? {
        didSet {
            if let item = item {
                self.bindItem(item)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        applyTheme()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        applyTheme()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpUI() {
        
    }
    
    func applyTheme() {
        self.selectionStyle = .none
    }
    
    func bindItem(_ item: T) {
        
    }
    
}

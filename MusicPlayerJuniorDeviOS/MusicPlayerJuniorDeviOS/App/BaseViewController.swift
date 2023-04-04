//
//  BaseViewController.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton?
    @IBOutlet weak var navigationTitleLabel: UILabel?
    
    let activityIndicatorView = NVActivityIndicatorView(
        frame: CGRect(x: 0, y: 0, width: 30, height: 30),
        type: .ballClipRotate, color: .white
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        self.navigationController?.navigationBar.isHidden = true
        
//        backButton.addTarget(self, action: #selector(self.handleBackAction), for: .touchUpInside)
        self.view.addSubview(activityIndicatorView)
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func handleBackAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController {
    public func showLoading() {
        activityIndicatorView.startAnimating()
    }
    
    public func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
}

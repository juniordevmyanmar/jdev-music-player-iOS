//
//  Common.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation
import UIKit

class Common {
    
    public static func toLogin() -> Bool {
        return DataStore.shared.token.isEmpty ? true : false
    }
    
    public static func changeRoot(_ vc: UIViewController) {
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

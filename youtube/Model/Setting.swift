//
//  Setting.swift
//  youtube
//
//  Created by Raghu Sairam on 29/11/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class Setting: NSObject {

    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {

        self.name = name
        self.imageName = imageName
    }
}

enum SettingName: String {
    case Cancel = "Cancel & Dismiss Completely"
    case Settings = "Settings"
    case TermsPrivacy = "Terms & privacy policy"
    case SendFeedback = "Send Feedback"
    case Help = "Help"
    case SwitchAccount = "Switch Account"
}

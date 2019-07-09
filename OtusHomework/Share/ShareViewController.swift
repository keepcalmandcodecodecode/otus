//
//  ShareViewController.swift
//  Share
//
//  Created by Developer on 09/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

let urlScheme = "igor.otushomework://"

class ShareViewController: SLComposeServiceViewController {
    
    override func isContentValid() -> Bool {
        return true
    }

    override func didSelectPost() {
        defer {
            self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        }
        
        guard let item = self.extensionContext?.inputItems[0] as? NSExtensionItem else {
            return
        }
        guard let attachments = item.attachments else {
            return
        }
        let type = kUTTypeText as String
        for attachment in attachments {
            if attachment.hasItemConformingToTypeIdentifier(type) {
                attachment.loadItem(forTypeIdentifier: type, options: nil) { (loadedItem, error) in
                    if let stringItem = loadedItem as? String {
                        let userDefaults = UserDefaults.standard
                        userDefaults.addSuite(named: "group.igor.lepeshkin.otus.homework")
                        userDefaults.setValue(stringItem, forKeyPath: "sharedText")
                        userDefaults.synchronize()
                    }
                }
            }
        }
        let u = URL(string: urlScheme)
        if let url = u {
            _ = openURL(url)
        }
    }

    override func configurationItems() -> [Any]! {
        return []
    }
    
    @objc func openURL(_ url: URL) -> Bool {
        var responder: UIResponder? = self
        while responder != nil {
            if let app = responder as? UIApplication {
                return app.perform(#selector(openURL(_:)), with: url) != nil
            }
            responder = responder?.next
        }
        return false
    }

}

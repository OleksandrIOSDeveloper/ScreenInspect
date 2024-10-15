//
//  Bundle+Language.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 01.06.2024.
//

import Foundation
import ObjectiveC

// a custom Bundle object with the main Bundle to switch languages dynamically.
private var bundleKey: UInt8 = 0

// Custom subclass of Bundle to override the localized string fetching behavior.
class BundleEx: Bundle {
    // Override the `localizedString` method to fetch the string from the associated bundle if available.
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        // Fetch the associated custom bundle (if one exists).
        guard let bundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle else {
            // If no associated bundle is found, fall back to the default implementation.
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        
        // If an associated bundle exists, use it to fetch the localized string.
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    
    // Function to set a new language by associating a bundle for the selected language.
    class func setLanguage(_ language: String) {
        // Defer the object replacement to ensure that it happens after the new bundle is set.
        defer {
            object_setClass(Bundle.main, BundleEx.self)
        }
        
        // Attempt to find the bundle path for the specified language's localization files.
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return
        }
        
        // Associate the new language bundle with the main Bundle using Objective-C runtime.
        objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}


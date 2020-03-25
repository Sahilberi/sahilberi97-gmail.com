//
//  Storyboard+Extension.swift
//  FlickarMVVMDemo
//
//  Created by sahil on 25/03/20.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit

protocol Storyboarded {
  static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
  static func instantiate() -> Self {
    // this pulls out "MyApp.MyViewController"
    let fullName = NSStringFromClass(self)
    
    // this splits by the dot and uses everything after, giving "MyViewController"
    let className = fullName.components(separatedBy: ".")[1]
    
    // load our storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    // instantiate a view controller with that identifier, and force cast as the type that was requested
    return storyboard.instantiateViewController(withIdentifier: className) as! Self
  }
}

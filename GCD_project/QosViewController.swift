//
//  QosViewController.swift
//  GCD_project
//
//  Created by Stanislav BEREZIN on 13.05.2024.
//

import UIKit

class QosViewController: UIViewController {
    
    let queue = DispatchQueue.global()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        queue.async(qos: .background) {
            print("background")
        }
        
        queue.async(qos: .utility) {
            print("utility")
        }
        
        queue.async(qos: .userInteractive) {
            print("userInteractive")
        }
        
        queue.async(qos: .userInitiated) {
            print("userInitiated")
        }
    }
}

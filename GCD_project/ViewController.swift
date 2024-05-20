//
//  ViewController.swift
//  GCD_project
//
//  Created by Stanislav BEREZIN on 13.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let queue = DispatchQueue(label: "queue", attributes: .concurrent)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        printMultiTreading()
        print("7")
    }
    
    func printMultiTreading() {
        print("2")
        
        queue.async {
            print("3")
            
            self.queue.sync {
                print("4")
            }
            
            print("5")
        }
        
        print("6")
    }
}


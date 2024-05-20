//
//  SemaphoreViewController.swift
//  GCD_project
//
//  Created by Stanislav BEREZIN on 13.05.2024.
//

import UIKit

class SemaphoreViewController: UIViewController {
    
    let queue = DispatchQueue(label: "Queue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 2)

    override func viewDidLoad() {
        super.viewDidLoad()
        semaphore.signal()
        queue.async {
            let _ = self.semaphore.wait(timeout: .distantFuture)
            Thread.sleep(forTimeInterval: 4)
            print("Block-1")
            self.semaphore.signal()
        }
        
        queue.async {
            let _ = self.semaphore.wait(timeout: .distantFuture)
            Thread.sleep(forTimeInterval: 2)
            print("Block-2")
            self.semaphore.signal()
        }
        
        queue.async(qos: .utility) {
            let _ = self.semaphore.wait(timeout: .distantFuture)
            Thread.sleep(forTimeInterval: 4)
            print("Block-3")
            self.semaphore.signal()
        }
        
        queue.async(qos: .background) {
            let _ = self.semaphore.wait(timeout: .distantFuture)
            Thread.sleep(forTimeInterval: 4)
            print("Block-4")
            self.semaphore.signal()
        }
    }
}

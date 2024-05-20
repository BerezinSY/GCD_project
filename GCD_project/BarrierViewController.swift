//
//  BarrierViewController.swift
//  GCD_project
//
//  Created by Stanislav BEREZIN on 15.05.2024.
//

import UIKit

class BarrierViewController: UIViewController {
    
    let queue = DispatchQueue(label: "Queue", attributes: .concurrent)
    let barrier = DispatchQueue.init(label: "b", attributes: .concurrent)
    var array: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...10 {
            queue.async {
                self.barrier.async(flags: .barrier) {
                    self.array.append(i)
                }
            }
        }
        
        DispatchQueue.main.async {
            self.array.sort(by: { $0 < $1 })
            print(self.array)
        }
    }
}

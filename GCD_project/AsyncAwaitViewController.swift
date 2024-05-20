//
//  AsyncAwaitViewController.swift
//  GCD_project
//
//  Created by Stanislav BEREZIN on 16.05.2024.
//

import UIKit

class AsyncAwaitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Task-1 executes in main thread")
        
        let task = Task {
            await executeTask()
            print("Task-3 executes after ASYNC Task")
            view.backgroundColor = .red
        }
        
        task.cancel()
        
        print("Task-2 executes in main thread")
    }
    
    func executeTask() async {
        print("Task executes async")
    }
}

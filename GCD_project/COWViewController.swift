//
//  COWViewController.swift
//  GCD_project
//
//  Created by Stanislav BEREZIN on 13.05.2024.
//

import UIKit

class COWViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension COWViewController {
    final class Ref<T> {
      var val : T
      init(_ v : T) {val = v}
    }
    struct Box<T> {
        var ref : Ref<T>
        init(_ x : T) { ref = Ref(x) }
        var value: T {
            get { return ref.val }
            set {
              if (!isKnownUniquelyReferenced(&ref)) {
                ref = Ref(newValue)
                return
              }
              ref.val = newValue
            }
        }
    }
}

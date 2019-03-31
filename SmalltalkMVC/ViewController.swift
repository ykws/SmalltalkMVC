//
//  ViewController.swift
//  SmalltalkMVC
//
//  Created by KAWASHIMA Yoshiyuki on 2019/03/31.
//  Copyright © 2019 KAWASHIMA Yoshiyuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var counterView: CounterView!

  override func viewDidLoad() {
    super.viewDidLoad()
    counterView.counterModel = CounterModel()
  }
}


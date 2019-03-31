//
//  ViewController.swift
//  SmalltalkMVC
//
//  Created by KAWASHIMA Yoshiyuki on 2019/03/31.
//  Copyright © 2019 KAWASHIMA Yoshiyuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private lazy var counterView = CounterView()
  
  override func loadView() {
    view = counterView
    view.backgroundColor = .white
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    counterView.counterModel = CounterModel()
  }
}


//
//  CounterController.swift
//  SmalltalkMVC
//
//  Created by KAWASHIMA Yoshiyuki on 2019/03/31.
//  Copyright © 2019 KAWASHIMA Yoshiyuki. All rights reserved.
//

import Foundation

class CounterController {
  weak var counterModel: CounterModel?
  required init() {}
  @objc func onMinusTapped() { counterModel?.countDown() }
  @objc func onPlusTapped() { counterModel?.countUp() }
}


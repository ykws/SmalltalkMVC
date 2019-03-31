//
//  CounterModel.swift
//  SmalltalkMVC
//
//  Created by KAWASHIMA Yoshiyuki on 2019/03/31.
//  Copyright © 2019 KAWASHIMA Yoshiyuki. All rights reserved.
//

import Foundation

final class CounterModel {
  let notificationCenter = NotificationCenter()
  private(set) var count = 0 {
    didSet {
      notificationCenter.post(name: .init(rawValue: "count"), object: nil, userInfo: ["count": count])
    }
  }
  func countDown() { count -= 1 }
  func countUp() { count += 1 }
}


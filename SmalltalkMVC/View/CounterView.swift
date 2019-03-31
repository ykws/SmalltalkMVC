//
//  CounterView.swift
//  SmalltalkMVC
//
//  Created by KAWASHIMA Yoshiyuki on 2019/03/31.
//  Copyright © 2019 KAWASHIMA Yoshiyuki. All rights reserved.
//

import UIKit

final class CounterView: UIView {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var plusButton: UIButton!
  
  var defaultControllerClass: CounterController.Type = CounterController.self
  private var counterController: CounterController?
  
  var counterModel: CounterModel? {
    didSet {
      registerModel()
    }
  }
  
  deinit {
    counterModel?.notificationCenter.removeObserver(self)
  }

  private func registerModel() {
    guard let model = counterModel else { return }
    
    let controller = defaultControllerClass.init()
    controller.counterModel = model
    counterController = controller
    
    label.text = model.count.description
    
    minusButton.addTarget(controller, action: #selector(CounterController.onMinusTapped), for: .touchUpInside)
    plusButton.addTarget(controller, action: #selector(CounterController.onPlusTapped), for: .touchUpInside)
    
    model.notificationCenter.addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil, using: {
       [unowned self] notification in
      if let count = notification.userInfo?["count"] as? Int {
        self.label.text = count.description
      }
    })
  }
}


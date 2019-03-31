//
//  CounterView.swift
//  SmalltalkMVC
//
//  Created by KAWASHIMA Yoshiyuki on 2019/03/31.
//  Copyright © 2019 KAWASHIMA Yoshiyuki. All rights reserved.
//

import UIKit

final class CounterView: UIView {
  private let label: UILabel = UILabel()
  private let minusButton: UIButton = UIButton()
  private let plusButton: UIButton = UIButton()
  
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setSubviews()
    setLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    return nil
  }
  
  private func setSubviews() {
    addSubview(label)
    addSubview(minusButton)
    addSubview(plusButton)
    
    label.textAlignment = .center
    
    label.backgroundColor = .blue
    minusButton.backgroundColor = .red
    plusButton.backgroundColor = .green
    
    minusButton.setTitle("-1", for: .normal)
    plusButton.setTitle("+1", for: .normal)
  }
  
  private func setLayout() {
    label.translatesAutoresizingMaskIntoConstraints = false
    minusButton.translatesAutoresizingMaskIntoConstraints = false
    plusButton.translatesAutoresizingMaskIntoConstraints = false

    label.topAnchor.constraint(equalTo: topAnchor).isActive = true
    label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: minusButton.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: plusButton.topAnchor).isActive = true
    label.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
    label.heightAnchor.constraint(equalTo: plusButton.heightAnchor).isActive = true
    
    minusButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    minusButton.rightAnchor.constraint(equalTo: plusButton.leftAnchor).isActive = true
    minusButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    minusButton.widthAnchor.constraint(equalTo: plusButton.widthAnchor).isActive = true
    
    plusButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    plusButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
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


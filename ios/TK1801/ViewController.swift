//
//  ViewController.swift
//  TK1801
//
//  Created by Iko Nakari on 2018/10/26.
//  Copyright © 2018 nakarin0528. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World"
        label.font = UIFont(name: "HiraginoSans-W6", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.setupViews()
    }

    private func setupViews() {
        self.view.addSubview(label)
        self.label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}


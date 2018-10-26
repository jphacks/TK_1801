//
//  RootVC.swift
//  TK1801
//
//  Created by Iko Nakari on 2018/10/26.
//  Copyright © 2018 nakarin0528. All rights reserved.
//

import UIKit
import SnapKit

class RootVC: UIViewController {

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.font = UIFont(name: "HiraginoSans-W6", size: 24)
        label.textColor = UIColor.darkGray
        label.sizeToFit()
        label.textAlignment = .center

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let url = URL(string: "https://www.google.co.jp/") {
            self.present(WebVC(url), animated: false)
        } else {
            self.setupViews()
        }
    }

    private func setupViews() {
        self.view.backgroundColor = .white

        self.view.addSubview(errorLabel)
        self.errorLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}


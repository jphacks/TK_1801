//
//  ViewController.swift
//  TK1801
//
//  Created by Iko Nakari on 2018/10/26.
//  Copyright © 2018 nakarin0528. All rights reserved.
//

import UIKit
import SnapKit
import WebKit

final class WebVC: UIViewController {

    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        return webView
    }()

    init(_ url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.load(url: url)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()

        print(self.webView.url)
    }

    private func setupViews() {
        self.view.addSubview(webView)
        self.webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func load(url: URL) {
        let request = URLRequest(url: url)
        self.webView.load(request)
    }

}

extension WebVC:  WKNavigationDelegate  {
}

extension WebVC: WKUIDelegate {
}

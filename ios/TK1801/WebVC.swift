import UIKit
import SnapKit
import WebKit
import SwiftyUserDefaults

final class WebVC: UIViewController {

//    var socketModel: SocketModel

    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        // iOS11からのドラッグアンドドロップによる画像反転禁止
        if #available(iOS 11.0, *) {
            webView.scrollView.subviews.first?.interactions = []
        }
        webView.scrollView.isScrollEnabled = true //スクロール可能に
        webView.scrollView.bounces = false // スクロール時のブラウザのバウンスなし
        let source = "var meta = document.createElement('meta');"
            + "meta.name = 'viewport';"
            + "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';"
            + "var head = document.getElementsByTagName('head')[0];"
            + "head.appendChild(meta);"

        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        webView.configuration.userContentController.addUserScript(script)

        let userContentController = WKUserContentController()
        let cookieScript: WKUserScript
        if let sessionID = Defaults[.sessionID] {
            cookieScript = WKUserScript(source: "document.cookie = 'PHPSESSID=\(sessionID);path=/';", injectionTime: .atDocumentStart, forMainFrameOnly: true)
            userContentController.addUserScript(cookieScript)
            webView.configuration.userContentController.addUserScript(cookieScript)

        }

        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")

        return webView
    }()

    init(_ url: URL) {
//        socketModel = SocketModel("http://202.182.125.217:3000")
        super.init(nibName: nil, bundle: nil)
        self.load(url: url)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }

    private func setupViews() {
        self.view.addSubview(webView)
        self.webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func load(url: URL) {
        var request = URLRequest(url: url)
        request.httpShouldHandleCookies = false
        if let sessionID = Defaults[.sessionID] {
            request.setValue("PHPSESSID=\(sessionID)",forHTTPHeaderField: "Cookie")
        }
        self.webView.load(request)
    }

}

extension WebVC:  WKNavigationDelegate  {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if Location.shared.authorizationStatus() == .denied {
            self.present(LocationDeniedVC(), animated: true, completion: nil)
        }

        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies {
            for item in $0 {
                if item.domain == "leadme.mz-kb.com" {
                    Defaults[.sessionID] = item.value
                }
            }
        }
    }

//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//        let response = navigationResponse.response as! HTTPURLResponse
//        let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.allHeaderFields as! [String : String], for: response.url!)
//        decisionHandler(.allow)
//
//        for c in cookies {
//            print(c.name + c.value)
//        }
//    }
    
}

extension WebVC: WKUIDelegate {
}

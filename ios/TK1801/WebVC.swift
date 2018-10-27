import UIKit
import SnapKit
import WebKit
import SwiftyUserDefaults

final class WebVC: UIViewController {

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

//        let userContentController = WKUserContentController()
//        let script = "document.cookie='_session_id=セッションID; domain=サーバードメイン; path=Cookieパス;"
//        let cookieScript = WKUserScript(source: script, injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: false)
//        userContentController.addUserScript(cookieScript)
//
//        let configuration = WKWebViewConfiguration()
//        configuration.userContentController = userContentController

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
//        request.setValue("_session_id=セッションID", forHTTPHeaderField: "Cookie")
        self.webView.load(request)
    }

}

extension WebVC:  WKNavigationDelegate  {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if Location.shared.authorizationStatus() == .denied {
            self.present(LocationDeniedVC(), animated: true, completion: nil)
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let urlResponse = navigationResponse.response as? HTTPURLResponse,
            let url = urlResponse.url,
            let allHeaderFields = urlResponse.allHeaderFields as? [String : String] {
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: allHeaderFields, for: url)
            print(cookies)
            for cookie in cookies {
                print(cookie.domain)
                if cookie.domain == endpoint {
                    print(cookie.domain)
//                    Defaults[.cookie] = cookie.domain
                }
            }
        }
        decisionHandler(.allow)
    }
}

extension WebVC: WKUIDelegate {
}

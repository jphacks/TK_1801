import UIKit

final class LocationDeniedVC: UIViewController {

    // TODO: appのアイコンをセット
    private let iv = UIImageView(image: UIImage(named: "icon"))

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Since the location info service is not ON,\nit is not possible to display nearby guides"
        label.textColor = .black
        label.font = UIFont(name: "HiraginoSans-W3", size: 12)!
        label.numberOfLines = 2

        return label
    }()

    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Turn on location info service", for: .normal)
        btn.setTitleColor(UIColor.app.orange, for: .normal)
        btn.titleLabel?.font = UIFont(name: "HiraginoSans-W3", size: 14)!
        btn.layer.cornerRadius = 24
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.app.orange.cgColor
        btn.addTarget(self, action: #selector(settingDidTap), for: .touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.app.paleGrey
        self.view.addSubview(iv)
        self.view.addSubview(label)
        self.view.addSubview(btn)
        self.iv.snp.makeConstraints {
            $0.top.equalToSuperview().inset(86)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(161)
        }
        label.snp.makeConstraints {
            $0.top.equalTo(iv.snp.bottom).offset(26)
            $0.centerX.equalToSuperview()
        }
        btn.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(32)
            $0.left.right.equalToSuperview().inset(47)
            $0.height.equalTo(48)
        }
    }

    @objc private func settingDidTap() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        self.dismiss(animated: false, completion: nil)
    }
}

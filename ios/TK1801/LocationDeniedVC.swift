import UIKit

final class LocationDeniedView: UIView {

    // TODO: appのアイコンをセット
    private let iv = UIImageView(image: UIImage(named: "icon"))

    let label: UILabel = {
        let label = UILabel()
        label.text = "Since the location info service is not ON,\nit is not possible to display nearby guides"
        label.textColor = .black
        label.font = UIFont(name: "HiraginoSans-W3", size: 12)!
        label.numberOfLines = 2

        return label
    }()

    let btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Turn on location info service", for: .normal)
        btn.setTitleColor(UIColor.app.orange, for: .normal)
        btn.titleLabel?.font = UIFont(name: "HiraginoSans-W3", size: 14)!
        btn.layer.cornerRadius = 24
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.app.orange.cgColor
        
        return btn
    }()

    init() {
        super.init(frame: .zero)
        isHidden = true
        backgroundColor = UIColor.app.paleGrey
        addSubview(iv)
        addSubview(label)
        addSubview(btn)
        iv.snp.makeConstraints {
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

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

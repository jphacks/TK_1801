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
        Location.shared.requestAuthorization()
        if let url = URL(string: urlMypage) {
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


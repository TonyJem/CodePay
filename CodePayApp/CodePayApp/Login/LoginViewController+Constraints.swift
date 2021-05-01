import UIKit
import SnapKit

extension LoginViewController {
    func setupConstraints() {
        personView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK:  - SnapKit Constraints Examples
/*
 make.width.equalToSuperview().multipliedBy(0.45)
 
 make.height.equalTo(45)
 
 make.width.equalTo(90)
 
 make.top.equalTo(viewProgress.snp.bottom).offset(32)
 
 make.centerX.equalToSuperview()
 
 make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
 
 make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
 */

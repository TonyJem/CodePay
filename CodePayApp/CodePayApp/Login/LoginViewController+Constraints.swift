import UIKit
import SnapKit

extension LoginViewController {
    
    func setupConstraints() {
        imageContainerView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
            
        loginLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(300)
            make.top.equalTo(imageContainerView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        phoneView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(70)
            make.top.equalTo(loginLabel.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
        }
        phoneView.setupConstraints()
        
        passwordView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(70)
            make.top.equalTo(phoneView.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        passwordView.setupConstraints()
        
        submitButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(300)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.centerX.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.lessThanOrEqualTo(300)
            make.top.equalTo(submitButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}

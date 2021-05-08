import UIKit
import SnapKit

extension LoginViewController {
    
    func setupConstraints() {
        let viewWidth = view.frame.size.width
        let imageContainerViewWidth = 90
        let imageSizeMultiplier = 0.8889
        let elementWidth: CGFloat = viewWidth * 0.7143
        
        let viewHeight = view.frame.size.height
//        let topInset: CGFloat = 30
        let imageContainerViewHeight = imageContainerViewWidth
        let spaceBetweenTitleAndImageContainerView: CGFloat = 20
        let titleHeight: CGFloat = 25
        let spaceBetweenStackViewAndTitle: CGFloat = 35
        let inputViewHeight: CGFloat = 70
        let spaceBetweenInputViews: CGFloat = viewHeight * 0.0267
        let spaceBetweenSubmitButtonAndSecondary: CGFloat = spaceBetweenTitleAndImageContainerView
        let submitButtonHeight: CGFloat = 60
        let secondaryButtonHeight: CGFloat = 40
        let bottomInset: CGFloat = 90
//        let bottomInset: CGFloat = viewHeight * 0.1651
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.height.equalTo(submitButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(bottomInset)
            make.centerX.equalToSuperview()
        }
        
        secondaryButton.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(elementWidth)
            make.height.equalTo(secondaryButtonHeight)
            make.top.equalTo(submitButton.snp.bottom).offset(spaceBetweenSubmitButtonAndSecondary)
            make.centerX.equalToSuperview()
        }
        
        mainScrollView.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.bottom.equalTo(submitButton.snp.top).offset(-30)
        }
    
        imageContainerView.snp.makeConstraints { make in
            make.width.equalTo(imageContainerViewWidth)
            make.height.equalTo(imageContainerViewHeight)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageSizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.height.equalTo(titleHeight)
            make.top.equalTo(imageContainerView.snp.bottom).offset(spaceBetweenTitleAndImageContainerView)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.top.equalTo(titleLabel.snp.bottom).offset(spaceBetweenStackViewAndTitle)
            make.centerX.equalToSuperview()
        }
        stackView.spacing = spaceBetweenInputViews
        
        phoneView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        phoneView.setupConstraints()
        
        passwordView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        passwordView.setupConstraints()
        
        confirmPasswordView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        confirmPasswordView.setupConstraints()
        
        currencyView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        currencyView.setupConstraints()
    }
}

extension LoginViewController {
    func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func keyboardWillAppear(_ keyboardHeight: CGFloat) {
        submitButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20 + keyboardHeight)
        }
        
        mainScrollView.snp.updateConstraints { make in
            make.bottom.equalTo(submitButton.snp.top).offset(-30)
        }
        
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    func keyboardWillDisappear() {
        submitButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(90)
        }
        
        mainScrollView.snp.updateConstraints { make in
            make.bottom.equalTo(submitButton.snp.top).offset(-30)
        }
        
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    @objc private func keyboardWillShow(notifaction: NSNotification) {
        guard let keyboardFrame = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        self.keyboardWillAppear(keyboardFrame.height)
    }
    
    @objc private func keyboardWillHide() {
        keyboardWillDisappear()
    }
}

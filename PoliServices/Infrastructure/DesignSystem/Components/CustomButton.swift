import UIKit

class CustomButton: UIView {
    
    private let mainButton = UIButton(type: .system)
    
    var action: (() -> Void)?
    
    init(
        title: String
    ) {
        super.init(frame: .zero)
        
        configureView()
        
        configureButton(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 150, height: 55)
    }
    
    private func configureView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.topAnchor.constraint(equalTo: topAnchor),
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureButton(title: String) {
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.tinted()
            
            configuration.cornerStyle = .capsule
            
            mainButton.configuration = configuration
        } else {
            mainButton.layer.cornerRadius = 16
        }
        
        mainButton.setTitle(title, for: .normal)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        mainButton.addTarget(self, action: #selector(didTapCustomButton), for: .touchUpInside)
    }
    
    @objc private func didTapCustomButton(_ sender: UIButton) {

        self.action?()
    }
}


import UIKit

class CustomLabel: UILabel {
    
    init(
        text: String = "-",
        size: CGFloat = 14,
        weight: UIFont.Weight = .regular,
        alignment: NSTextAlignment = .left,
        textColor: UIColor = .mainLabel
    ) {
        super.init(frame: .zero)
        
        configureLabel(text: text,
                       size: size,
                       weight: weight,
                       alignment: alignment,
                       textColor: textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel(text: String,
                                size: CGFloat,
                                weight: UIFont.Weight,
                                alignment: NSTextAlignment,
                                textColor: UIColor) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        
        self.textAlignment = alignment
        
        self.textColor = textColor
        
        self.numberOfLines = 0
    }
}

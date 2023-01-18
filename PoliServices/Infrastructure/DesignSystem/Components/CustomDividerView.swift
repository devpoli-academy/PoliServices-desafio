import UIKit

class CustomDividerView: UIView {
    
    init(
        color: UIColor = .mainIndigo
    ) {
        super.init(frame: .zero)
        
        configureView(color: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        
        let width = UIScreen.main.bounds.size.width
        
        return CGSize(width: width - 110, height: 1)
    }
    
    private func configureView(color: UIColor) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = color
    }
}

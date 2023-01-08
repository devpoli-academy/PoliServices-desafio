import UIKit

class CustomDividerView: UIView {
    
    init(
        color: UIColor = .systemIndigo
    ) {
        super.init(frame: .zero)
        
        configureView(color: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        
        let width = window?.windowScene?.screen.bounds.size.width ?? 100
        
        return CGSize(width: width - 110, height: 1)
    }
    
    private func configureView(color: UIColor) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = color
    }
}

import UIKit

class CustomImageView: UIImageView {
    
    init(
        systemImageName: String = "",
        contentMode: UIView.ContentMode = .scaleAspectFit,
        imageColor: UIColor = .white
    ) {
        super.init(frame: .zero)
        
        configureImageView(systemImageName: systemImageName,
                           contentMode: contentMode,
                           imageColor: imageColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView(systemImageName: String,
                                    contentMode: UIView.ContentMode,
                                    imageColor: UIColor) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.image = UIImage(named: systemImageName)?.withRenderingMode(.alwaysTemplate)
        
        self.contentMode = contentMode
        
        self.tintColor = imageColor
    }
}

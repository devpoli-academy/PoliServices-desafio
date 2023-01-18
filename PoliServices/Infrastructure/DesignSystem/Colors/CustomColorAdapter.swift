import UIKit

extension CustomColor {
    
    func toUIColor() -> UIColor {
            
        switch self {
            
        case .cyan:
            return .cyan
        case .green:
            return .green
        case .magenta:
            return .magenta
        case .brown:
            return .brown
        }
    }
}

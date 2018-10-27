import UIKit

extension UIColor: AppExtensionConvertable {}

extension AppExtension where Base: UIColor {

    static var orange: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 128.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
    }

    static var whiteOrange: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 185.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
    }

    static var warmGray: UIColor {
        return UIColor(red: 0.90, green: 0.90, blue: 0.91, alpha: 1.0)
    }

    static var whiteGray: UIColor {
        return UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
    }

    static var warmBlack: UIColor {
        return UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.0)
    }

    static var lineGreen: UIColor {
        return UIColor(red: 0.00, green: 0.73, blue: 0.00, alpha: 1.0)
    }

    static var messengerBlue: UIColor {
        return UIColor(red: 0.27, green: 0.54, blue: 1.00, alpha: 1.0)
    }


    static var untSteel: UIColor {
        return UIColor(red: 130.0 / 255.0, green: 135.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0)
    }

    static var untCloudyBlue: UIColor {
        return UIColor(red: 194.0 / 255.0, green: 206.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    }

    static var fbColor: UIColor {
        return UIColor(red: 71.0 / 255.0, green: 104.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0)
    }

    static var twitterColor: UIColor {
        return UIColor(red: 32.0 / 255.0, green: 163.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0)
    }

    static var paleGrey: UIColor {
        return UIColor(red: 243.0 / 255.0, green: 245.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
    }

}

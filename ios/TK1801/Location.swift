import Foundation
import CoreLocation
import SwiftyUserDefaults

final class Location:NSObject {

    static let shared = Location() //シングルトン

    static let notificationForChangeLocation = Notification.Name("ChangeLocation")
    static let notificationForChangeAuthorization = Notification.Name("ChangeAuthorization")
    static let notificationForErrorLocation = Notification.Name("ErrorLocation")

    let manager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest // 距離制度最高
        manager.distanceFilter = kCLDistanceFilterNone //少しでも動いたら通知
        manager.allowsBackgroundLocationUpdates = true // バックグラウンドでの更新
        manager.pausesLocationUpdatesAutomatically = false //自動的に位置情報を一時停止しない
        manager.startUpdatingLocation() //位置情報の取得を開始する
        manager.distanceFilter = 1 // 1m間隔で更新

        return manager
    }()

    override init() {
        super.init()
        self.manager.delegate = self
    }

    // m単位で距離を返す
    func distanceFromCurrentLocation(to: CLLocation) -> CLLocationDistance {
        let currentLocation = CLLocation(latitude: latitude!, longitude: longitude!)
        return to.distance(from: currentLocation)
    }

    //  認可状態を取得する
    func authorizationStatus() -> CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }

    // 認可リクエストを送っていなければ、認可を求める
    func requestAuthorization() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.manager.requestAlwaysAuthorization()
        }
    }
}

extension Location: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Location.notificationForChangeAuthorization, object: nil)
    }

    // 位置情報が更新されたときに呼ばれる
    func locationManager(_ manager: CLLocationManager, didUpdateLocations _: [CLLocation]) {
        guard let location = manager.location else { return }
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude

        // TODO位置情報送信
        if let latitude = latitude, let longitude = longitude {
            print(latitude)
            print(longitude)
        }

        let state: UIApplication.State = UIApplication.shared.applicationState
        if state == .background || state == .inactive {
            print("background")
        }

        // 位置情報が変わった事を通知する
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Location.notificationForChangeLocation, object: nil)
    }

    // 位置情報の取得でエラーが発生
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        // エラーを通知する
        // 位置情報が変わった事を通知する
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Location.notificationForErrorLocation, object: nil)
    }
}


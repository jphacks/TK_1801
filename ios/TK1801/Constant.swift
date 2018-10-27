import KeychainAccess
import SwiftyUserDefaults

extension DefaultsKeys {
    static let latitude = DefaultsKey<Double?>("latitude")
    static let longitude = DefaultsKey<Double?>("longitude")
    static let cookie = DefaultsKey<String?>("cookie")
    static let userID = DefaultsKey<Int?>("userID")
    static let isLoggedIn = DefaultsKey<Bool?>("isLoggedIn")
}

let endpoint = "https://leadme.mz-kb.com/"

let urlLogin = endpoint + "login"
let urlRegister = endpoint + "register"



var latitude: Double? {
    get { return Defaults[.latitude] }
    set(value) { Defaults[.latitude] = value }
}

var longitude: Double? {
    get { return Defaults[.longitude] }
    set(value) { Defaults[.longitude] = value }
}

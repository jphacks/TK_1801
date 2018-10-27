import KeychainAccess
import SwiftyUserDefaults

extension DefaultsKeys {
    static let latitude = DefaultsKey<Double?>("latitude")
    static let longitude = DefaultsKey<Double?>("longitude")
}

let endpoint = "https://leadme.mz-kb.com/"

let urlRegister = endpoint + "register"



var latitude: Double? {
    get { return Defaults[.latitude] }
    set(value) { Defaults[.latitude] = value }
}

var longitude: Double? {
    get { return Defaults[.longitude] }
    set(value) { Defaults[.longitude] = value }
}

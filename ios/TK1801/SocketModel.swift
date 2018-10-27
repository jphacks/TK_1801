import SocketIO
import SwiftyUserDefaults

final class SocketModel {

    let socket: SocketIOClient
    var token = ""
    var getJson: NSDictionary!
    var jsonIp = ""
    var isStart = false

    init(_ url: String) {
        let manager = SocketManager(socketURL: URL(string: url)!, config: [.log(true), .extraHeaders(["user_id": "7"])])
        socket = manager.defaultSocket
    }

    func connect() {
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }

        socket.on("sendLocationToClient") { data, _ in
            // 位置情報を受け取ったときの処理
            // (地図のプロットを追加・更新)
        }

        socket.on("sendDisconnectionToClient") {data, ack in
            // 接続切れを受け取ったときの処理
            // (地図のプロットを削除)
        }

        socket.connect()
    }

    func sendGPS(latitude: Double, longitude: Double) {
        // 位置情報を送る処理
        let params: [String:Double] = [
            "lat": latitude,
            "lng": longitude
        ]
        socket.emit("sendLocationToServer", params)
    }

}

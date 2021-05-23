//
//  SocketClientManager.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/22.
//

//import UIKit
//import SocketIO
//
//class SocketClientManager:NSObject {
//    static let shared = SocketClientManager()
//    var manager = SocketManager(socketURL: URL(string: "https://print-chat-app-test.azurewebsites.net/")!, config: [.log(true),.compress])
//    var socket:SocketIOClient!
//    override init() {
//        super.init()
//        socket = self.manager.defaultSocket
//
//        socket.on("login") { dataArray,ack in
//            print(dataArray)
//        }
//    }
//
//    func startConnection() {
//        socket.connect()
//
//    }
//
//    func closeConnection() {
//        socket.disconnect()
//    }
//
//    func sendMessage(message:String,who:String) {//서버로 전달
//        socket.emit("new message", ["usermane":who,"message":message])
//    }
//
//
//}

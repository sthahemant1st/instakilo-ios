//
//  ReachabilityManager.swift
//  Ios Helpers
//
//  Created by Insight Workshop on 10/2/18.
//  Copyright © 2018 Insight Workshop. All rights reserved.
//
//swiftlint:disable all
import Foundation
import ReachabilitySwift

protocol NoInternetConnectionDelegate: AnyObject {
    func didConnectToInternet()
}

class NoInternetManager: NSObject {
    
    static  let shared = NoInternetManager()
    
    var isNetworkAvailable: Bool {
        return reachabilityStatus != .notReachable
    }
    
    private var reachabilityStatus: Reachability.NetworkStatus = .notReachable
    private let reachability = Reachability()!
    private var listeners: [NoInternetConnectionDelegate] = []
    
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        reachabilityStatus = reachability.currentReachabilityStatus
        updateInternetConnectivity()
    }
    
    private func updateInternetConnectivity() {
        switch reachabilityStatus {
        case .notReachable:
            NoInternetConnectionViewHandler.shared.showNoInternetView()
        default:
            notifyListeners()
            NoInternetConnectionViewHandler.shared.hideNoInternetConnectionView()
        }
    }
    
    func startMonitoring() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.reachabilityChanged),
                         name: ReachabilityChangedNotification,
                         object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    func stopMonitoring() {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: ReachabilityChangedNotification,
                                                  object: reachability)
    }
    
    func addListener(_ listener: NoInternetConnectionDelegate) {
        listeners.append(listener)
    }
    
    func removeListener(_ listener: LocationListener) {
        listeners = listeners.filter { $0 !== listener }
    }
    
    func notifyListeners() {
        for listener in listeners {
            listener.didConnectToInternet()
        }
    }
    
}
//swiftlint:enable all

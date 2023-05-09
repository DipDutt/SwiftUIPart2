//
//  ContentView.swift
//  localPushNotification
//
//  Created by Dip Dutt on 24/3/23.
//

import SwiftUI
import UserNotifications


class NotificationManager {
    static let manager = NotificationManager()
    private init () {}
    
    // asking  user like to see any notification
    func requestAuthorization() {
        let options:UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { bool, error in
            
            if let error = error {
                print("Error:\(error.localizedDescription)")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "You get 10 points"
        content.subtitle = " add more 10 points to get a prize🎁"
        content.sound = .default
        content.badge = 1
        
        // time
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // calender
        var dateComponents = DateComponents()
        dateComponents.hour = 1
        dateComponents.minute = 49
        
        let trigger2 = UNCalendarNotificationTrigger(dateMatching:dateComponents , repeats: true)
        // location
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger:trigger2 )
        UNUserNotificationCenter.current().add(request)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button("press here") {
                NotificationManager.manager.requestAuthorization()
            }
            
            
            Button("schedule notification") {
                NotificationManager.manager.scheduleNotification()
            }
            
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

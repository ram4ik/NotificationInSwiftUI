//
//  ContentView.swift
//  NotificationInSwiftUI
//
//  Created by ramil on 21.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var alert  = false
    
    var body: some View {
        Button(action: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (status, _) in
                if status {
                    let content = UNMutableNotificationContent()
                    content.title = "Notification"
                    content.body = "Hello :)"
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: "not", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    
                    return
                }
                self.alert.toggle()
            }
            
        }) {
            Text("Send Notification")
        }.alert(isPresented: $alert) {
            return Alert(title: Text("Please Enable Notification Access in Settings Pannel!!!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

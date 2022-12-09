//
//  ContentView.swift
//  Messaging
//
//  Created by Dounia Belannab on 09/12/2022.
//

import Dispatch
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MessageScheduler()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MessageScheduler: View {
    @State private var message: String = ""
    @State private var recipient: String = ""
    @State private var scheduledTime: Date = Date()

    var body: some View {
        Form {
            TextField("Message", text: $message)

            TextField("Recipient", text: $recipient)

            DatePicker("Scheduled Time", selection: $scheduledTime)

            Button(action: {
                // Calculate the dispatch time using the scheduled time

                let dispatchTime = DispatchTime.now() + scheduledTime.timeIntervalSinceNow

                // Schedule the message for delivery at the specified time

                DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                    // Send the message to the specified recipients

                    sendMessage(message, to: recipient)
                }

            }) {
                Text("Schedule Message")
            }
        }
    }

    func sendMessage(_ message: String, to: String) {
        print("sending " + message + " to: " + to)
    }
}

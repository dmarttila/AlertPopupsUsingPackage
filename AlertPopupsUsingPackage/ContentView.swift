//
//  ContentView.swift
//  AlertPopupsUsingPackage
//
//  Created by Douglas Marttila on 12/27/21.
//

import SwiftUI
import AlertPopUp_iOS13

struct ContentView: View {
    @State private var alertParams: AlertParams?
    
    func destroySomething () {
        print ("OMG Destroying!")
    }
    
    var body: some View {
        VStack {
            Text(alertParams?.message ?? "alerParams is currently nil, which means the alert does not show")
            Button("Alert with one button and action") {
                alertParams = AlertParams(title: "One Button", message: "Only One Button", showTwoButtons: false, primaryButtonLabel: "Single button func") { print("Single button func") }
            }
            Button("Alert with one button and no func") {
                alertParams = AlertParams(title: "One button", message: "Clicking OK will only close the alert")
            }
            
            Button("Alert with two buttons desctructive") {
                alertParams = AlertParams(title: "Destructive Title", message: "Desctrucive description", showTwoButtons: true, primaryButtonLabel: "Destroy!", destructive: true, primaryButtonAction: destroySomething)
            }
            
            Button("Alert with two buttons not destructive") {
                alertParams = AlertParams(title: "Non-destructive", message: "Two buttons", showTwoButtons: true, primaryButtonLabel: "Non-destructive ") { print("No destruction here") }
            }
        }
        .modifier(AlertModifier(alertParams: $alertParams))
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

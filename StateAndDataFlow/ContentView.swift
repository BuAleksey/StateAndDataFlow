//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    private var storageManager = StorageManager()
    
    var body: some View {
        VStack {
            Text("Hi, \(storageManager.takeName())")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            StartButtonView(timer: timer)
                .padding(16)
            LogOutButtonView(action: logOut)
            Spacer()
        }
    }
    
    private func logOut() {
        userManager.isRegister.toggle()
        storageManager.logOut()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

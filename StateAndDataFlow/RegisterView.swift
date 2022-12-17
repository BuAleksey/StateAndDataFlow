//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var charactersCount = 0
    @EnvironmentObject private var userManager: UserManager
    private var storageManager = StorageManager()
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                TextField("Enter your name...", text: $name)
                Text(charactersCount.formatted())
                    .onChange(of: name.count) { charactersCount = $0 }
                    .foregroundColor(charactersCount < 3 ? .red : .green)
            }
            .multilineTextAlignment(.center)
            .padding(16)
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: charactersCount < 3 ? "x.circle" : "checkmark.circle")
                    Text("OK")
                }
                .foregroundColor(charactersCount < 3 ? .gray : .green)
            }
        }
    }
    
    private func registerUser() {
        if charactersCount >= 3 {
            userManager.isRegister.toggle()
            storageManager.logIn(name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

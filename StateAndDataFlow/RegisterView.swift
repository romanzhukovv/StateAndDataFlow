//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...",
                          text: $name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                Text("\(name.count)")
                    .foregroundColor(name.count > 2 ? Color.green : Color.red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(name.count > 2 ? false : true)
            }
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            StorageManager.shared.saveName(name: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

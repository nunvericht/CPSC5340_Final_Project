//
//  LoggedInView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/14/24.
//

import SwiftUI

struct MainChatView: View {

    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var chatViewModel = ChatViewModel()
    @State var messageText = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    UserView()
                        .background(Color("Tan"))
                    ScrollView {
                        Text("Welcome, \(authViewModel.email)")
                            .foregroundStyle(Color(.white))
                            .padding()
                        ForEach(chatViewModel.messages) { message in
                            MessageView(message: message, userId: chatViewModel.userId)
                        }
                    }
                }
                MessageInputView(messageText: $messageText, action: chatViewModel.sendMessage)
                .padding()
                Button("Logout") {
                    authViewModel.logout()
                }
                .foregroundStyle(Color(.blue))
            }
        }
    }
}


struct MainChat_Previews: PreviewProvider {
    static var previews: some View {
        MainChatView()
            .environmentObject(AuthViewModel())
    }
}

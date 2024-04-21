//
//  MessageView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI


struct MessageView: View {
    
    let message: ChatMessage
    let userId: String
    @State private var showTime = false
    
    var isCurrentUser: Bool {
        message.userID == userId
    }
    
    var body: some View {
        VStack(alignment: isCurrentUser ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(isCurrentUser ?
                                Color("Gray2") : Color("Green2"))
                    .cornerRadius(10)
            }
            .frame(minWidth: 300, alignment: isCurrentUser ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .padding(isCurrentUser ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.userID == userId ? .leading : .trailing)
        .padding(isCurrentUser ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
    /*var body: some View {
            VStack(alignment: message.userID == userId ? .trailing : .leading) {
                HStack {
                Text(message.text)
                    .padding()
                    .background(message.userID == userId ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .foregroundStyle(Color(.white))
            
                Text(formatDate(message.timeStamp))
                    .font(.footnote)
                    .foregroundStyle(Color(.gray))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: message.userID == userId ? .trailing : .leading)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }*/
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMessage = ChatMessage(id: "1", text: "How can I help?", userID: "user123", timeStamp: Date())
        let sampleUserId = "user123"
        MessageView(message: sampleMessage, userId: sampleUserId)
            .previewLayout(.sizeThatFits)
    }
}

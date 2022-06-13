//
//  iMessageViewFactory+MessageList.swift
//  iMessageClone
//
//  Created by Stefan Blos on 13.06.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

extension iMessageViewFactory {
    func makeMessageTextView(
        for message: ChatMessage,
        isFirst: Bool,
        availableWidth: CGFloat,
        scrolledId: Binding<String?>
    ) -> some View {
        guard let userId = chatClient.currentUserId else {
            return iMessageMessageView(message: message.text, isCurrentUser: false, isFirst: isFirst)
        }
        return iMessageMessageView(message: message.text, isCurrentUser: userId == message.author.id, isFirst: isFirst)
    }
}

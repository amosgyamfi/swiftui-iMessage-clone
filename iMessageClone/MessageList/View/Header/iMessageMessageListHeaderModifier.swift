//
//  iMessageMessageListHeaderModifier.swift
//  iMessageClone
//
//  Created by Stefan Blos on 15.06.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct iMessageMessageListHeaderModifier: ChatChannelHeaderViewModifier {
    
    var channel: ChatChannel
    @State private var showVideoCall = false
    @State private var showInfoScreen = false
    
    func body(content: Content) -> some View {
        content.toolbar {
            iMessageMessageListHeader(
                viewModel: iMessageMessageListHeaderViewModel(channel: channel),
                isInfoSheetShown: $showInfoScreen,
                isVideoSheetShown: $showVideoCall
            )
        }
        .sheet(isPresented: $showVideoCall) {
            // TODO: add links to the video integration guides
            Text("Not supported yet")
        }
        .sheet(isPresented: $showInfoScreen) {
            ChatChannelInfoView(channel: channel)
        }
    }
}

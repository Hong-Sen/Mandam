//
//  ConversationRowSubView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/19.
//

import SwiftUI

struct ConversationRowSubView: View {
    var question: Conversation = Conversation(mainQ: "mainQ", subQ: ["subQ1", "subQ2", "subQ3","subQ4"], age: .teenager, relationship: .friend)
    var body: some View {
        List{
            ForEach(question.subQ, id: \.self){ i in
                Text(i)
            }
        }
        .listStyle(.plain)
    }
}

struct ConversationRowSubView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationRowSubView()
    }
}

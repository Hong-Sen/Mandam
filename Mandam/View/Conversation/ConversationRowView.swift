//
//  ConversationRowView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/19.
//

import SwiftUI

struct ConversationRowView: View {
    var question: Conversation = Conversation(mainQ: "mainQ", subQ: ["subQ1", "subQ2", "subQ3","subQ4"], age: .teenager, relationship: .friend)
    @State private var isShowSubQ: Bool = false
    
    var body: some View {
        Button {
            isShowSubQ = !isShowSubQ
        } label: {
            VStack(alignment: .leading) {
                HStack{
                    Text(question.mainQ)
                        .bold()
                    Spacer()
                    Image(systemName: isShowSubQ ? "chevron.up" : "chevron.down")
                }
                if isShowSubQ {
                    ConversationRowSubView(question: question)
                        .frame(width: .infinity, height: 42*CGFloat(question.subQ.count), alignment: .leading)
                    // 유연하게 크기 지정 (추후 변경)
                }
            }
            
        }
        .padding()
    }
}

struct ConversationRowView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationRowView()
    }
}

//
//  ConversationView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/16.
//

import SwiftUI

struct Conversation: Hashable{
    var mainQ: String
    var subQ: [String]
}

struct ConversationView: View {
    @State private var isShowFilter: Bool = false;
    @State private var searchString: String = ""
    @State private var isSearch: Bool = false;
    private var conversationList: [Conversation] = [Conversation(mainQ: "너의 MBTI가 무엇이니?", subQ: ["E/I = 외향적/내향적", "S/N = 감각형/직관형", "T/F = 사고형 / 감정형", "J/P = 판단형/인식형"]), Conversation(mainQ: "올 때 뭐 타고 왔니?", subQ: ["얼마나 걸렸어?", "막혔어?"])]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(isShowing: $isSearch, text: $searchString)
                List{
                    ForEach(conversationList.filter{$0.mainQ.contains(searchString) || searchString == ""}, id:\.self) { i in
                        ConversationRowView(question: i)
                    }
                }
//                .listStyle(.plain)
            }
            .navigationTitle("대화하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSearch = !isSearch
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowFilter = true
                    } label: {
                        Text("필터")
                    }
                    .sheet(isPresented: $isShowFilter) {
                        FilterView(isShowFilter: $isShowFilter)
                    }
                }
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}

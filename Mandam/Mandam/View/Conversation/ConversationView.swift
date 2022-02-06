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
    var age: AgeCategory
    var relationship: RelationshipCategory
}

struct ConversationView: View {
    @State private var isShowFilter: Bool = false;
    @State private var searchString: String = ""
    @State private var isSearch: Bool = false
    
    @ObservedObject var selectedFilter: SelectedFilters = SelectedFilters()
    
    private var conversationList: [Conversation] = [Conversation(mainQ: "너의 MBTI가 무엇이니?", subQ: ["E/I = 외향적/내향적", "S/N = 감각형/직관형", "T/F = 사고형 / 감정형", "J/P = 판단형/인식형"], age: .teenager, relationship: .friend), Conversation(mainQ: "올 때 뭐 타고 왔니?", subQ: ["얼마나 걸렸어?", "막혔어?"], age: .Midtwenties, relationship: .friend)]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(isShowing: $isSearch, text: $searchString)
                
                VStack{
                    HStack {
                        Spacer()
                        Text("나이: \(selectedFilter.age.rawValue)")
                        Spacer()
                        Text("관계: \(selectedFilter.relationship.rawValue)")
                        Spacer()
                    }
                }
                .padding()
                
                List{
                    ForEach(conversationList.filter{$0.mainQ.contains(searchString.uppercased()) || searchString == ""}, id:\.self) { i in
                        if selectedFilter.age == .all || selectedFilter.age == i.age {
                            if selectedFilter.relationship == .all || selectedFilter.relationship  == i.relationship {
                                ConversationRowView(question: i)
                                    .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding()
                .listStyle(.plain)
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
                        FilterView(isShowFilter: $isShowFilter, selectFilters: selectedFilter)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}

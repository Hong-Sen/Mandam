//
//  CommunityView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/16.
//

import SwiftUI

struct Opinion: Hashable {
    var timestamp = String(Date().timeIntervalSince1970)
    var age: AgeCategory
    var relationship: RelationshipCategory
    var opinion: String
    var like: Int
}

class OpinionList: ObservableObject {
    var opinionList : [Opinion] = [Opinion(age: .teenager, relationship: .friend, opinion: "너 mbti가 어떻게 돼?", like: 1), Opinion(age: .Earlytwenties, relationship: .priesthood, opinion: "교수님, 언제부터 저희 과에 계셨나요?", like: 3), Opinion(age: .teenager, relationship: .friend, opinion: "너 mbti가 어떻게 돼?", like: 1), Opinion(age: .Earlytwenties, relationship: .priesthood, opinion: "교수님, 언제부터 저희 과에 계셨나요?", like: 3), Opinion(age: .teenager, relationship: .friend, opinion: "너 mbti가 어떻게 돼?", like: 1), Opinion(age: .Earlytwenties, relationship: .priesthood, opinion: "교수님, 언제부터 저희 과에 계셨나요?", like: 3), Opinion(age: .teenager, relationship: .friend, opinion: "너 mbti가 어떻게 돼?", like: 1), Opinion(age: .Earlytwenties, relationship: .priesthood, opinion: "교수님, 언제부터 저희 과에 계셨나요?", like: 3), Opinion(age: .teenager, relationship: .friend, opinion: "너 mbti가 어떻게 돼?", like: 1), Opinion(age: .Earlytwenties, relationship: .priesthood, opinion: "교수님, 언제부터 저희 과에 계셨나요?", like: 3)]
    
    func getOpinion(index: Int) -> Opinion {
        return opinionList[index]
    }
    
    func updateLikeCnt(day: String) {
        if let index = opinionList.firstIndex(where: {$0.timestamp == day}){
            let op = getOpinion(index: index)
            opinionList[index] = Opinion(age: op.age, relationship: op.relationship, opinion: op.opinion, like: op.like + 1)
        }
    }
}

struct CommunityView: View {
    @State private var searchString: String = ""
    @State private var isSearch: Bool = false
    @State private var isShowAddOpinion: Bool = false
    var opList = OpinionList().opinionList
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    SearchBar(isShowing: $isSearch, text: $searchString)
                    Text("새로운 대화법을 올려주세요!")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    List{
                        ForEach(opList.filter{$0.opinion.contains(searchString) || searchString == ""}, id:\.self) { i in
                            CommunityRowView(op: i)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
                Button {
                    isShowAddOpinion = true
                } label: {
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 70, height: 60)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                }
                .background(Color.blue)
                .cornerRadius(38.5)
                .padding()
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
                
            }
            .navigationTitle("커뮤니티")
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
                        //
                    } label: {
                        Image(systemName: "person")
                    }
                    .fullScreenCover(isPresented: $isShowAddOpinion) {
                        AddOpinionView(isShowAddOpinion: $isShowAddOpinion)
                    }
                }
                
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}

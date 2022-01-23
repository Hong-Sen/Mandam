//
//  AddOpinionView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/22.
//

import SwiftUI

struct AddOpinionView: View {
    @Binding var isShowAddOpinion: Bool
    @State var text: String = "내용 입력"
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack{
                Group {
                    Divider()
                    VStack(alignment: .leading) {
                        Text("나이")
                            .font(.system(size: 20, weight: .heavy))
                            .padding(.leading, 30)
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(AgeCategory.allCases, id: \.self) { i in
                                customCategory(text: i.rawValue)
                            }
                        }
                        .padding(.vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("관계")
                            .font(.system(size: 20, weight: .heavy))
                            .padding(.leading, 30)
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(RelationshipCategory.allCases, id: \.self) { i in
                                customCategory(text: i.rawValue)
                            }
                        }
                        .padding(.vertical)
                    }
                    
                    Divider()
                    
                    TextEditor(text: $text)
                        .frame(width: .infinity, height: 150, alignment: .center)
                        .padding()
                    
                    ZStack {
                        Color.gray
                        Text("가이드")
                    }
                    .padding(.bottom)
                    
                    Button {
                        // 업로드 기능 기능
                        isShowAddOpinion = false
                    } label: {
                        Text("적용하기")
                            .font(.system(size: 20))
                            .padding(.horizontal, 40)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("글 쓰기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowAddOpinion = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

struct AddOpinionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOpinionView(isShowAddOpinion: .constant(true))
    }
}

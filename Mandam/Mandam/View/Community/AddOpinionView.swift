//
//  AddOpinionView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/22.
//

import SwiftUI

struct AddOpinionView: View {
    @Binding var isShowAddOpinion: Bool
    @State var text: String = ""
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack(alignment: .leading){
                    Group {
                        Divider()
                            .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("나이")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.leading, 35)
                            
//                            LazyVGrid(columns: columns, spacing: 15) {
//                                ForEach(AgeCategory.allCases, id: \.self) { i in
//                                    customCategory(text: i.rawValue)
//                                }
//                            }
//                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack(alignment: .leading){
                            Text("관계")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.leading, 35)
                            
//                            LazyVGrid(columns: columns, spacing: 15) {
//                                ForEach(RelationshipCategory.allCases, id: \.self) { i in
//                                    customCategory(text: i.rawValue)
//                                }
//                            }
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack(alignment: .leading) {
                            Text("대화법을 작성해주세요.")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.leading, 35)
                            
                            TextEditor(text: $text)
                                .frame(height: 130, alignment: .center)
                                .padding()
                                .border(.gray)
                                .padding(.horizontal,30)
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack(alignment: .leading) {
                            Text("글 작성시 유의사항\n")
                                .font(.system(size: 16, weight: .bold))
                            
                            Text("유의사항1")
                            Text("유의사항2")
                            Text("유의사항3")
                        }
                        .padding(.leading, 35)
                        .foregroundColor(.gray)
                        
                        Divider()
                            .padding(.vertical)
                    }
                }
                
                VStack(alignment: .center){
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
                .padding(.bottom)
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
}

struct AddOpinionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOpinionView(isShowAddOpinion: .constant(true))
    }
}

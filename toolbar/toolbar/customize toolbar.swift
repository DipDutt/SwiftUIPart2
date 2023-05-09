//
//  customize toolbar.swift
//  toolbar
//
//  Created by Dip Dutt on 17/2/23.
//

import SwiftUI

struct customize_toolbar: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("SwiftUI")
                .navigationTitle("toolbar")
                .toolbar {
                    ToolbarItem(id: "1", placement: .primaryAction) {
                        Button("Settings") {
                            
                        }
                        
                    }
                        
                    ToolbarItem(id: "2", placement: .secondaryAction) {
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Delete")
                                Image(systemName: "trash.circle")
                            }
                        }

                        
                    }
                    
                    ToolbarItem(id: "3", placement: .secondaryAction) {
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Copy")
                                Image(systemName: "doc.on.doc.fill")
                            }
                        }
                    }
                    
                    
                    
                    ToolbarItem(id: "4", placement: .secondaryAction) {
                    
                            Button {
                                
                            } label: {
                                HStack {
                                    Text("Duplicate")
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                }
                            }
                            
                        }
                        
                    ToolbarItem(id: "5", placement: .navigationBarLeading) {
                        Button("Save") {
                            
                        }
                        
                    }
                    
                }
                .toolbarRole(.editor)
            }
        }
    }
}

struct customize_toolbar_Previews: PreviewProvider {
    static var previews: some View {
        customize_toolbar()
    }
}

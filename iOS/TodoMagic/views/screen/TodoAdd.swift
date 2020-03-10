//
//  TodoAdd.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/05.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI
import Foundation

let systemIcons = [
    "moon.zzz",
    "zzz",
    "cloud",
    "umbrella",
    "flame",
    "slowmo",
    "keyboard",
    "circle.grid.hex",
    "heart",
    "star",
    "flag",
    "tag",
    "rectangle",
    "shield",
    "burst",
    "a.circle",
    "b.circle",
    "c.circle",
    "d.circle",
    "e.circle",
    "f.circle"
]

struct TodoAdd: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var todos: [TodoModel]
    @State var todo: TodoModel = TodoModel(
        title: "", image: systemIcons[0], text: ""
    )

    var body: some View {
        List {
            TodoEditView(todo: $todo)
        }
        .navigationBarTitle("Todo Add")
        .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                if (self.todo.title != "") {
                    self.todos.append(self.todo)
                    self.todos = self.todos.sorted(by: {!$0.hasChecked && $1.hasChecked})
                }
            }) {
                Text("DONE")
            }
        ).onAppear {
            self.todo.image = systemIcons.randomElement() ?? systemIcons[0];
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TodoAdd_Previews: PreviewProvider {
    static var previews: some View {
        TodoAdd(todos: .constant(todos))
    }
}
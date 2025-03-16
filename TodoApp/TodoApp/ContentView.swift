import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = []
    @State private var newTask: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            
            // Title
            Text("To-Do List")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .center)
            
            // Task List with Delete Button
            List {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Text(task)
                            .font(.body)
                            .foregroundColor(.black)
                        
                        Spacer() // Pushes the delete button to the right

                        Button(action: {
                            deleteTask(task)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(PlainButtonStyle()) // Removes default button styling
                    }
                    .padding(.vertical, 5) // Adds spacing between rows
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Input Field and Button
            HStack {
                TextField("Enter a task", text: $newTask)
                    .padding(10)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.leading, 10)

                Button(action: addTask) {
                    Text("Add")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    // Function to Add Task
    private func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
        }
    }
    
    // Function to Delete Task
    private func deleteTask(_ task: String) {
        tasks.removeAll { $0 == task }
    }
}

#Preview {
    ContentView()
}

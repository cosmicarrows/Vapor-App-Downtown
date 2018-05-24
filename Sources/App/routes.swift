import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    //add a new route to handle a get request.
    //each parameter is a path component in the URL...i.e. when a user enters http:localhost:8080/hello/vapor
    //next it supplies a closure for when this route is invoked
    //req is a Request object and this closure returns a string as the result for this route.
    router.get("hello", "vapor") { req -> String in
        return "Hello Laurence You're a Great Developer!"
        
    }
    
    //add a new route that will say hello to anyone who visits
    //use string.parameter to specify that the second parameter can be any String object
    router.get("hello", String.parameter) { req -> String in
        //2, below, extract the user's name which is passed in the Request object
        let name = try req.parameters.next(String.self)
        //3
        return "Hello, \(name)"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}



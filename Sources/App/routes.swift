import Fluent
import Vapor

func routes(_ app: Application) throws {
    let controller = AuthController()
        app.post("register", use: controller.register)
}

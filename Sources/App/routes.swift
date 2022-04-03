import Fluent
import Vapor

func routes(_ app: Application) throws {
    let controller = AuthController()
    app.post("auth", use: controller.auth)
    app.post("logout", use: controller.logout)
    app.post("register", use: controller.register)
    app.post("changeuserdata", use: controller.changeUserData)
}

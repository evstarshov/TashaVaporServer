import Fluent
import Vapor

func routes(_ app: Application) throws {
    let controller = AuthController()
    let cartController = CartController()
    let reviewController = ReviewController()
    app.post("auth", use: controller.auth)
    app.post("logout", use: controller.logout)
    app.post("register", use: controller.register)
    app.post("changeuserdata", use: controller.changeUserData)
    app.post("getcart", use: cartController.getCart)
    app.post("addtocart", use: cartController.addToCart)
    app.post("deletefromcart", use: cartController.deleteFromCart)
    app.post("paycart", use: cartController.payCart)
    app.post("getreviews", use: reviewController.getReviews)
    app.post("addreview", use: reviewController.addReview)
    app.post("removereview", use: reviewController.removeReview)
}

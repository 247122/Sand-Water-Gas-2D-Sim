import Scenes
import Igis

class backgroundLayer: Layer {

    let background = Background()

    init() {
        super.init(name:"backgroundLayer")
        insert(entity:background, at:.back)
    }
}

class Background: RenderableEntity {

    var backGroundColor: Color
    var backGroundSize: Size

    init() {
        backGroundColor = Color(.gray)
        backGroundSize = Size(width:0, height: 0)        
    }

    override func calculate(canvasSize:Size) {
        backGroundSize = canvasSize
    }

    func backGroundRect(canvasSize:Size,canvas:Canvas) {
        let rectFillStyle = FillStyle(color:backGroundColor)
        let rect = Rectangle(rect:Rect(topLeft:Point(x:0,y:0),size:canvasSize),fillMode:.fill)
        canvas.render(rectFillStyle,rect)
    }

    override func render(canvas:Canvas) {
        backGroundRect(canvasSize:backGroundSize,canvas:canvas)
    }
}

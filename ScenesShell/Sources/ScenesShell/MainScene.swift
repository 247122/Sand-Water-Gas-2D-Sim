import Igis
import Scenes

class MainScene : Scene {

    init() {
        super.init(name:"Main")
        
        let board = Board(rows:5,columns:5)
        let BackgroundLayer = backgroundLayer()
        let BoardLayer = drawBoardLayer(board:board,position:Point(x:100,y:100),size:Size(width:10,height:10))
        
        insert(layer:BackgroundLayer, at:.back)    
        insert(layer:BoardLayer, at:.front)
    }
}

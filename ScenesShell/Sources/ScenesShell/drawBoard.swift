import Scenes
import Igis

class drawBoardLayer: Layer {
    
    init(board: Board, position: Point, size: Size) {
        super.init(name:"drawBoardLayer")

        let drawboard = drawBoard(cellSize:size, board:board, position:position)
        insert(entity:drawboard, at:.front)
    }
}

class drawBoard: RenderableEntity {

    var board: Board
    var cellSize: Size
    var position: Point
    
    init(cellSize: Size, board:Board, position: Point) {
        self.board  = board
        self.cellSize = cellSize
        self.position = position
    }

    func cellRect(cell: Cell, position: Point, canvas: Canvas) {
        var cellFillStyle: FillStyle
        let block = cell.type
        switch block {
        case Block.Water:
            cellFillStyle = FillStyle(color:Color(.blue))
        case Block.Wall:
            cellFillStyle = FillStyle(color:Color(.black))
        case Block.Gas:
            cellFillStyle = FillStyle(color:Color(.gray))
        case Block.Sand:
            cellFillStyle = FillStyle(color:Color(.yellow))
        default:
            cellFillStyle = FillStyle(color:Color(.white))
        }
        let cellRect = Rectangle(rect:Rect(topLeft:position, size:cellSize), fillMode:.fill)
        cell.cellRect = cellRect
        canvas.render(cellFillStyle, cellRect)        
    }

    override func render(canvas:Canvas) {
        let height = board.rows
        let width = board.columns

        for y in 0..<height {
            for x in 0..<width {
                let point = Point(x:(cellSize.width*x)+position.x, y:(cellSize.height*y)+position.y)
                cellRect(cell:board.board[y][x], position: point, canvas:canvas)                
                print("(\(y),\(x)) \(board.board[y][x].cellRect.rect.topLeft), Width:\(board.board[y][x].cellRect.rect.size.width), height:\(board.board[y][x].cellRect.rect.size.height)")
            }
        }
    }
    
}

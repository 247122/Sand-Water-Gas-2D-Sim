import Scenes
import Igis

enum Block {
    case Wall
    case Empty
    case Water
    case Gas
    case Sand
}

class Cell: RenderableEntity, MouseDownHandler {

    let x: Int
    let y: Int
    
    var neighbors: [Cell?]
    let type: Block        
    
    init(x:Int, y:Int, type:Block) {
        self.x = x
        self.y = y
        self.type = type       
        neighbors = []
    }

    func findNeighbors(board:Board) {
        let rows = board.rows
        let columns = board.columns
        // Iterate through board
        for row in 0..<rows {
            for column in 0..<columns {

                let neighbors = [[1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1], [0,1], [1,1]]

                for neighbor in neighbors {
                    // row and column indexes for the neighbors subtracting/adding 1 and 0 from them
                    let r = row + neighbor[0]
                    let c = column + neighbor[1]
                    //Check if inbound
                    if (r < rows && r >= 0) && (c < columns && c >= 0) {
                        self.neighbors.append(board.board[r][c])
                    } else {
                        self.neighbors.append(nil)
                    }
                }
            }
        }
        
    }
    
    func onMouseDown(globalLocation:Point) {
    }    
}

import Scenes
import Igis

class Cell {

    let x: Int
    let y: Int

    var neighbors: [Cell?]
    var type: Block

    var cellRect: Rectangle
    
    init(x:Int, y:Int, type:Block) {
        self.x = x
        self.y = y
        self.type = type
        neighbors = []
        cellRect = Rectangle(rect:Rect(topLeft:Point(x:0, y:0), size:Size(width:0, height:0)))
    }

    func findNeighbors(board:Board) {
        let rows = board.rows
        let columns = board.columns
        // Iterate through board
        for row in 0..<rows {
            for column in 0..<columns {
                //                b[0]   bl[1]   l[2]    tl[3]    t[4]    tr[5]   r[6]   br[7]
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

    func setNextLocation(board:Board) {

        let currentBlock = self.type
        let boardArray = board.board

        switch currentBlock {                    
        case Block.Water:           
            if neighbors[0] != nil {
                if neighbors[0]!.type == Block.Empty {
                    boardArray[y+1][x].type = currentBlock
                }
            } else if neighbors[1] != nil {
                if neighbors[1]!.type == Block.Empty {
                    boardArray[y+1][x-1].type = currentBlock
                }
            } else if neighbors[7] != nil {
                if neighbors[7]!.type == Block.Empty {
                    boardArray[y+1][x+1].type = currentBlock
                }
            } else if neighbors[2] != nil {
                if neighbors[2]!.type == Block.Empty {
                    boardArray[y][x-1].type = currentBlock
                }
            } else if neighbors[6] != nil {
                if neighbors[6]!.type == Block.Empty {
                    boardArray[y][x+1].type = currentBlock
                    boardArray[y][x].type = Block.Empty
                }
            }           
            boardArray[y][x].type = Block.Empty
            
        case Block.Gas:
            if neighbors[4] != nil {
                if neighbors[4]!.type == Block.Empty {
                    boardArray[y-1][x].type = currentBlock
                }
            } else if neighbors[3] != nil {
                if neighbors[3]!.type == Block.Empty {
                    boardArray[y-1][x-1].type = currentBlock
                }
            } else if neighbors[5] != nil {
                if neighbors[5]!.type == Block.Empty {
                    boardArray[y-1][x+1].type = currentBlock
                }
            } else if neighbors[2] != nil {
                if neighbors[2]!.type == Block.Empty {
                    boardArray[y][x-1].type = currentBlock
                }
            } else if neighbors[6] != nil {
                if neighbors[6]!.type == Block.Empty {
                    boardArray[y][x+1].type = currentBlock
                }
            }
            boardArray[y][x].type = Block.Empty 
            
        case Block.Sand:
            if neighbors[0] != nil {
                if neighbors[0]!.type == Block.Empty {
                    boardArray[y+1][x].type = currentBlock
                }
            } else if neighbors[2] != nil {
                if neighbors[2]!.type == Block.Empty {
                    boardArray[y][x-1].type = currentBlock
                }                
            } else if neighbors[5] != nil {
                if neighbors[5]!.type == Block.Empty {
                    boardArray[y-1][x+1].type = currentBlock
                }
            } 
            boardArray[y][x].type = Block.Empty 
            
        default:
            // DOO DOO hah
            do{};do{}
        }
    }    
    
    func hitTest(globalLocation:Point) -> Bool {
        let xRange = cellRect.rect.topLeft.x ..< cellRect.rect.topLeft.x+cellRect.rect.size.width
        let yRange = cellRect.rect.topLeft.y ..< cellRect.rect.topLeft.y+cellRect.rect.size.height
        print("Clicked on cell: \(self.x),\(self.y)")
        return xRange.contains(globalLocation.x) && yRange.contains(globalLocation.y)
    }    
}

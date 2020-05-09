import Scenes
import Igis

class Board {

    var board: [[Cell]]
    var rows: Int
    var columns: Int

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns

        //Create empty board
        var line: [Cell] = []
        board = []
        for row in 0..<rows {
            for column in 0..<columns {
                line.append(Cell(x:column,y:row,type:Block.Empty))
            }
            board.append(line)
            line = []
        }        
    }

    func nextGeneration() {

        let boardCopy = board
        
        for row in 0..<rows {
            for column in 0..<columns {
                
            }
        }
        
    }
    
}

.pragma library


var main_width = 640
var main_height = 480

function calcHSpacing(width, height, cols, cell_width)
{
    var extra = (width - (cols * cell_width))
    return Math.round(extra / (cols+1))
}
function calcVSpacing(width, height, rows, cell_width)
{
    var extra = (height - (rows * cell_width))
    return Math.round(extra / (rows+1))
}

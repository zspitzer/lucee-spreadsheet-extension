<cfscript>
/**
* Adds a split pane to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @xpos Horizontal position of the split in points
* @ypos Vertical position of the split in points
* @splitcol Leftmost visible column in the right pane
* @splitrow Top visible row in the bottom pane
* @position Active pane: UPPER_LEFT, UPPER_RIGHT, LOWER_LEFT, or LOWER_RIGHT
*/
void function SpreadsheetAddSplitPane(
	required any spreadsheet,
	required numeric xpos,
  required numeric ypos,
  required numeric splitcol,
  required numeric splitrow,
  string position="UPPER_LEFT"
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addSplitPane(
    workbook: arguments.spreadsheet,
    xSplitPosition: arguments.xpos,
    ySplitPosition: arguments.ypos,
    leftmostColumn: arguments.splitcol,
    topRow: arguments.splitrow,
    activePane: arguments.position
  )
}
</cfscript>
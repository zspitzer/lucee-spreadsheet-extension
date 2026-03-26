<cfscript>
void function SpreadsheetAddSplitPane(
	required any spreadsheet,
	required numeric xpos,
  required numeric ypos,
  required numeric splitcol,
  required numeric splitrow,
  string position="UPPER_LEFT" //Valid values are LOWER_LEFT, LOWER_RIGHT, UPPER_LEFT, and UPPER_RIGHT
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
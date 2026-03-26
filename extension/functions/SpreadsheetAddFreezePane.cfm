<cfscript>
void function SpreadsheetAddFreezePane(
	required any spreadsheet,
	required numeric freezeColumn,
  required numeric freezeRow,
  numeric column,
  numeric row
){
	arguments.workbook = arguments.spreadsheet
  arguments.leftmostColumn = arguments.column
  arguments.topRow = arguments.row
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addFreezePane( argumentCollection=arguments )
}
</cfscript>
<cfscript>
void function SpreadsheetClearCellRange(
	required any spreadsheet,
	required numeric startRow,
	required numeric startColumn,
  required numeric endRow,
  required numeric endColumn
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.clearCellRange( argumentCollection=arguments )
}
</cfscript>
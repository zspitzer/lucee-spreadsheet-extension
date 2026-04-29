<cfscript>
/**
* Auto-sizes a column to fit its content.
* @spreadsheet The spreadsheet workbook object
* @column Column number to auto-size
* @useMergedCells Whether to consider merged cells when calculating width
*/
void function SpreadsheetAutoSizeColumn(
  required any spreadsheet,
  required numeric column,
  boolean useMergedCells=false
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.autoSizeColumn( argumentCollection=arguments )
}
</cfscript>
<cfscript>
/**
* Merges a range of cells in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @startRow First row of the merge range
* @endRow Last row of the merge range
* @startColumn First column of the merge range
* @endColumn Last column of the merge range
*/
void function SpreadsheetMergeCells(
	required any spreadsheet,
	required numeric startRow,
	required numeric endRow,
  required numeric startColumn,
  required numeric endColumn
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.mergeCells( argumentCollection=arguments )
}
</cfscript>
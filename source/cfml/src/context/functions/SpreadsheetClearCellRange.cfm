<cfscript>
/**
* Clears the contents of a range of cells in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @startRow First row of the range
* @startColumn First column of the range
* @endRow Last row of the range
* @endColumn Last column of the range
*/
void function SpreadsheetClearCellRange(
	required any spreadsheet,
	required numeric startRow,
	required numeric startColumn,
  required numeric endRow,
  required numeric endColumn
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.clearCellRange( argumentCollection=arguments )
}
</cfscript>
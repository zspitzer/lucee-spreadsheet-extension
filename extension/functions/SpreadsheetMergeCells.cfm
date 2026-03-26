<cfscript>
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
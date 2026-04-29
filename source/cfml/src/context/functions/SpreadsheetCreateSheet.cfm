<cfscript>
/**
* Creates a new sheet in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @sheetName Name for the new sheet
*/
void function SpreadsheetCreateSheet(
	required any spreadsheet,
  string sheetName
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.createSheet( argumentCollection=arguments )
}
</cfscript>
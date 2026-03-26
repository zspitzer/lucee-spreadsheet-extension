<cfscript>
void function SpreadsheetCreateSheet(
	required any spreadsheet,
  string sheetName
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.createSheet( argumentCollection=arguments )
}
</cfscript>
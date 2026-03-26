<cfscript>
void function SpreadsheetAddRow(
	required any spreadsheet,
	required string data,
	numeric row,
	numeric column,
	boolean insert=true,
  string delimiter=","
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addRow( argumentCollection=arguments )
}
</cfscript>
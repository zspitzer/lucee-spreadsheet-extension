<cfscript>
void function SpreadsheetAddColumn(
	required any spreadsheet,
	required string data,
	numeric startRow,
	numeric startColumn,
	boolean insert=true,
	string delimiter=","
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addColumn( argumentCollection=arguments )
}
</cfscript>
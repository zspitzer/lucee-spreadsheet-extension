<cfscript>
void function SpreadsheetAddInfo(
	required any spreadsheet,
	required struct properties
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addInfo( arguments.spreadsheet, arguments.properties )
}
</cfscript>
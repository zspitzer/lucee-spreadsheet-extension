<cfscript>
void function SpreadsheetSetHeader(
	required any spreadsheet,
	string leftHeader="",
	string centerHeader="",
	string rightHeader="",
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setHeader( argumentCollection=arguments )
}
</cfscript>
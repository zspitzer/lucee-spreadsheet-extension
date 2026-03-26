<cfscript>
void function SpreadsheetSetFooter(
	required any spreadsheet,
	string leftFooter="",
	string centerFooter="",
	string rightFooter="",
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setFooter( argumentCollection=arguments )
}
</cfscript>
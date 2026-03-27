<cfscript>
/**
* Sets the page header for printing a spreadsheet.
* @spreadsheet The spreadsheet workbook object
* @leftHeader Text for the left section of the header
* @centerHeader Text for the center section of the header
* @rightHeader Text for the right section of the header
*/
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
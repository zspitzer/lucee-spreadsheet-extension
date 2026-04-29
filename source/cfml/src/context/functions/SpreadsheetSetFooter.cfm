<cfscript>
/**
* Sets the page footer for printing a spreadsheet.
* @spreadsheet The spreadsheet workbook object
* @leftFooter Text for the left section of the footer
* @centerFooter Text for the center section of the footer
* @rightFooter Text for the right section of the footer
*/
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
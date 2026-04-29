<cfscript>
/**
* Adds page breaks for rows and/or columns to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @rowBreaks Comma-delimited list of row numbers at which to add breaks
* @columnBreaks Comma-delimited list of column numbers at which to add breaks
*/
void function SpreadsheetAddPageBreaks(
	required any spreadsheet,
	string rowBreaks="",
	string columnBreaks=""
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.addPageBreaks( argumentCollection=arguments )
}
</cfscript>

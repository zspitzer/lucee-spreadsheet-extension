<cfscript>
/**
* Gets the number of columns in a worksheet.
* @spreadsheet The spreadsheet workbook object
* @sheetNameOrNumber Optional sheet name or number. Defaults to the active sheet.
*/
numeric function SpreadsheetGetColumnCount(
	required any spreadsheet,
	any sheetNameOrNumber
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	return spreadsheetCFML.getColumnCount( argumentCollection=arguments )
}
</cfscript>

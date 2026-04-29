<cfscript>
/**
* Adds an auto filter to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @cellRange Optional cell range (e.g. "A1:C5"). Defaults to all columns in the specified row.
* @row Row number to apply the filter to. Defaults to 1.
*/
void function SpreadsheetAddAutofilter(
	required any spreadsheet,
	string cellRange="",
	numeric row=1
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.addAutofilter( argumentCollection=arguments )
}
</cfscript>

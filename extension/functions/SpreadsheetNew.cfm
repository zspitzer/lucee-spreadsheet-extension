<cfscript>
/**
* Creates a new spreadsheet workbook object.
* @sheetName Name of the initial sheet
* @xmlFormat If true, creates an XLSX (XML) workbook instead of XLS (binary)
*/
any function SpreadsheetNew( string sheetName, boolean xmlFormat=false ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  return spreadsheetCFML.New( argumentCollection=arguments )
}
</cfscript>
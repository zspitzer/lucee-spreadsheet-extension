<cfscript>
any function SpreadsheetNew( string sheetName, boolean xmlFormat=false ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  return spreadsheetCFML.New( argumentCollection=arguments )
}
</cfscript>
<cfscript>
any function SpreadsheetReadBinary( required any spreadsheet ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  return spreadsheetCFML.readBinary( arguments.spreadsheet )
}
</cfscript>
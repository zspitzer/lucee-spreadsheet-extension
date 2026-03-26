<cfscript>
any function SpreadsheetRead( required string src ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  return spreadsheetCFML.read( src=arguments.src )
}
</cfscript>
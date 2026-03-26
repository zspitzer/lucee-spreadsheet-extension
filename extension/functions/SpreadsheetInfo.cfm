<cfscript>
any function SpreadsheetInfo( required any spreadsheet ){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	return spreadsheetCFML.info( arguments.spreadsheet )
}
</cfscript>
component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "cfspreadsheet action=write", ()=>{

			it( "Writes a password-protected xlsx file when password is supplied", ()=>{
				var data = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ] ] )
				var path = variables.tempXlsxPath
				var spreadsheet = SpreadsheetNew( "default", true )
				SpreadsheetAddRows( spreadsheet, data )
				```
				<cfspreadsheet action="write" name="spreadsheet" filename="#path#" password="secret" overwrite="true">
				```
				expect( ()=>s.read( src=path ) ).toThrow()
				var actual = s.read( src=path, password="secret", format="query" )
				expect( actual ).toBe( data )
			})

			it( "Writes a spreadsheet object to a file correctly", ()=>{
				var data = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					var spreadsheet = SpreadsheetNew()
					SpreadSheetAddRows( spreadsheet, data )
					```
					<cfspreadsheet action="write" name="spreadsheet" filename="#path#" overwrite="true">
					```
					var expected = data
					var actual = s.read( src=path, format="query" )
					expect( actual ).toBe( expected )
				})
			})

			it( "Can write a spreadsheet file from a query", ()=>{
				var data = QueryNew( "first,last", "VarChar,VarChar", [ [ "Frumpo", "McNugget" ] ] )
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					```
					<cfspreadsheet action="write" query="data" filename="#path#" overwrite="true">
					```
					var expected = data
					var actual = s.read( src=path, format="query", headerRow=1 )
					expect( actual ).toBe( expected )
				})
			})

			it( "Can write a spreadsheet file from a CSV string", ()=>{
				var csvString = 'column1,column2#NewLine()#Frumpo McNugget,12345'
				var path = tempXlsPath
				```
				<cfspreadsheet action="write" format="csv" name="csvString" filename="#path#" overwrite="true">
				```
				var expected = QueryNew( "column1,column2", "", [ [ "Frumpo McNugget", "12345" ] ] )
				var actual = s.read( src=path, format="query", headerRow=1 )
				expect( actual ).toBe( expected )
			})

		})

	}

}

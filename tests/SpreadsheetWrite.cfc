component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetWrite", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Writes a spreadsheet object to a file correctly", ()=>{
				var data = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
				workbooks.Each( ( type, wb )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.addRows( wb, data )
					SpreadsheetWrite( wb, path, true )
					var expected = data
					var actual = s.read( src=path, format="query" )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}

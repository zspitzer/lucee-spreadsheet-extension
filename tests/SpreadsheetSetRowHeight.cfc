component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetSetRowHeight", ()=>{

			beforeEach( ()=>{
				var query = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
				var xls = s.workbookFromQuery( query )
				var xlsx = s.workbookFromQuery( data=query, xmlFormat=true )
				variables.workbooks = { xls: xls, xlsx: xlsx }
				variables.newHeight = 30
			})

			it( "Sets the height of a row in points.", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetSetRowHeight( wb, 2, newHeight )
					var row = s.getRowHelper().getRowFromActiveSheet( wb, 2 )
					expect( row.getHeightInPoints() ).toBe( newHeight )
				})
			})

		})

	}

}

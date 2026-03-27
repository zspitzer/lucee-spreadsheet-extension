component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetDeleteRows", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Deletes the data in a specified range of rows", ()=>{
				var data = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ], [ "d", "e" ], [ "f", "g" ], [ "h", "i" ] ] )
				var expected = QueryNew( "column1,column2","VarChar,VarChar", [ [ "", "" ], [ "", "" ], [ "d", "e" ], [ "", "" ], [ "h", "i" ] ] )
				workbooks.Each( ( type, wb )=>{
					s.addRows( wb, data )
					SpreadsheetDeleteRows( wb, "1-2,4" )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}

component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetDeleteColumn", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Deletes the data in a specified column", ()=>{
				var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "", "c" ], [ "", "d" ] ] )
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, "a,b" ).addColumn( wb, "c,d" )
					SpreadsheetDeleteColumn( wb, 1 )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}

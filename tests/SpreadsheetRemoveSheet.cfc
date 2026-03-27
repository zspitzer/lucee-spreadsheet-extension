component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetRemoveSheet", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Deletes the sheet name specified", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.createSheet( wb, "test" )
					SpreadsheetRemoveSheet( wb, "test" )
					expect( wb.getNumberOfSheets() ).toBe( 1 )
				})
			})

		})

	}

}

component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetSetActiveSheet", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Sets the specified sheet name to be active", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.createSheet( wb, "test" )
					SpreadsheetSetActiveSheet( wb, "test" );
					expect( s.getSheetHelper().getActiveSheetName( wb ) ).toBe( "test" );
				})
			})

		})

	}

}

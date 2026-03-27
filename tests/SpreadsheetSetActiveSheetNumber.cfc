component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetSetActiveSheetNumber", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Sets the specified sheet name to be active", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.createSheet( wb, "test" )
					SpreadsheetSetActiveSheetNumber( wb, 2 );
					expect( s.getSheetHelper().getActiveSheetName( wb ) ).toBe( "test" );
				})
			})

		})

	}

}

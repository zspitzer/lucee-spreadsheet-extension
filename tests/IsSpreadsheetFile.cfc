component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "IsSpreadsheetFile", ()=>{

			it( "reports true for a valid xls file", ()=>{
				var path = getTestFilePath( "test.xls" )
				expect( IsSpreadsheetFile( path ) ).toBeTrue()
			})

			it( "reports true for a valid xlsx file", ()=>{
				var path = getTestFilePath( "test.xlsx" )
				expect( IsSpreadsheetFile( path ) ).toBeTrue()
			})

			it( "reports false for a non-spreadsheet file", ()=>{
				var path = getTestFilePath( "test.png" )
				expect( IsSpreadsheetFile( path ) ).toBeFalse()
			})

		})

	}

}

component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "IsSpreadsheetObject", ()=>{

			it( "reports false for a variable which is not a spreadsheet object", ()=>{
				var objectToTest = "a string"
				expect( IsSpreadsheetObject( objectToTest ) ).toBeFalse()
			})

			it( "reports true for a binary spreadsheet object", ()=>{
				var path = getTestFilePath( "test.xls" )
				var objectToTest = s.read( path )
				expect( IsSpreadsheetObject( objectToTest ) ).toBeTrue()
			})

			it( "reports true for an xml spreadsheet object", ()=>{
				var path = getTestFilePath( "test.xlsx" )
				var objectToTest = s.read( path )
				expect( IsSpreadsheetObject( objectToTest ) ).toBeTrue()
			})

		})

	}

}

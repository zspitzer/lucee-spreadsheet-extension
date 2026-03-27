component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetSetCellComment", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Can set a comment in the specified cell", ()=>{
				var theComment = {
					author: "cfsimplicity"
					,comment: "This is the comment in row 1 column 1"
				}
				var expected = Duplicate( theComment ).Append( { column: 1, row: 1 } )
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, "1" )
					SpreadsheetSetCellComment( wb, theComment, 1, 1 )
					var actual = s.getCellComment( wb, 1, 1 )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}

<cfscript>
describe( "SpreadsheetGetCellComment", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "Can get a comment from the specified cell", ()=>{
		var theComment = {
			author: "cfsimplicity"
			,comment: "This is the comment in row 1 column 1"
		}
		var expected = Duplicate( theComment ).Append( { column: 1, row: 1 } )
		workbooks.Each( ( type, wb )=>{
			s.addColumn( wb, "1" ).setCellComment( wb, theComment, 1, 1 )
			var actual = SpreadsheetGetCellComment( wb, 1, 1 )
			expect( actual ).toBe( expected )
		})
	})

	it( "Can get all comments in the current sheet", ()=>{
		var data = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
		var dataAsArray = [ [ "a", "b" ], [ "c", "d" ] ]
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, data )
			var comments = []
			comments.Append( { author: "cfsimplicity", comment: "This is the comment in row 1 column 1", column: 1, row: 1 } )
			comments.Append( { author: "cfsimplicity", comment: "This is the comment in row 2 column 2", column: 2, row: 2 } )
			s.setCellComment( wb, comments[ 1 ], 1, 1 )
				.setCellComment( wb, comments[ 2 ], 2, 2 )
			var expected = comments
			var actual = SpreadsheetGetCellComment( wb )
			expect( actual ).toBe( expected )
		})
	})

	

})	
</cfscript>
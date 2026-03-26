<cfscript>
describe( "SpreadsheetAddInfo", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

  it( "Can add metadata to a workbook", ()=>{
    var properties = { author: "Bob" }
    workbooks.Each( ( type, wb )=>{
			SpreadsheetAddInfo( wb, properties )
			var expected = "Bob"
			var actual = s.info( wb ).author
			expect( actual ).toBe( expected )
		})
  })

})
</cfscript>
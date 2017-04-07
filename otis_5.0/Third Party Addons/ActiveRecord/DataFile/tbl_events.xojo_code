#tag Class
Protected Class tbl_events
Inherits DataFile.ActiveRecordBase
	#tag Method, Flags = &h0
		Shared Function BaseSQL(bAsCount as Boolean = false) As String
		  dim ars() as string
		  
		  ars.Append "select "
		  if bAsCount = false then
		    ars.Append "*"
		  else
		    ars.Append "count(*) as iCnt"
		  end if
		  
		  ars.Append "From tbl_events"
		  
		  Return ars.JoinSQL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteOK(Byref sError as string) As Boolean
		  //Add your delete Validation here
		  
		  //Use sError to provide feedback to the user.
		  //Example:
		  //sError = "This Record cannot be deleted because xyz"
		  
		  
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FindByID(id as Integer) As DataFile.tbl_events
		  //Usage:
		  //dim tbl_events as DataFile.tbl_events = DataFile.tbl_events.FindByID( id )
		  dim s as string
		  s = "Select * from tbl_events WHERE pkid = " + str(id)
		  
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  if DB.error then
		    System.debugLog DB.ErrorMessage
		    return nil
		  end
		  if rs.RecordCount = 0 then return nil
		  
		  dim tbl_events as new DataFile.tbl_events
		  tbl_events.ReadRecord(rs)
		  return tbl_events
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GroupRecords(oEvents() as Datafile.tbl_events, sGroupField as string) As Dictionary
		  dim dictReturn as New Dictionary
		  dim sCurrentGroupName as String
		  dim oCurrentGroup() as DataFile.tbl_events
		  
		  // Loop through the inventory
		  For each oEvent as DataFile.tbl_events In oEvents
		    dim jsFieldValues as JSONItem
		    
		    // Get the field value pairs as a json item of this item
		    jsFieldValues = oEvent.GetMyFieldValues(True)
		    
		    // Check to see if the Current group name is the same as the one in this item
		    If jsFieldValues.Value(sGroupField) <> sCurrentGroupName then
		      ' The current group and the current item differ
		      
		      // Check if there is anything in the current group
		      If oCurrentGroup.Ubound <> -1 Then
		        ' The current group is not empty
		        
		        // Store the current group in the return dict
		        '          We have to make a copy of the Array otherwise we get right fucked
		        dim StupidDamnArrays() as DataFile.tbl_events
		        For Each oElement as DataFile.tbl_events In oCurrentGroup
		          StupidDamnArrays.Append(oElement)
		        Next
		        dictReturn.Value(sCurrentGroupName) = StupidDamnArrays
		        
		        // Clear the current group 
		        ReDim oCurrentGroup(-1)
		        
		        // update the current group name
		        sCurrentGroupName = jsFieldValues.Value(sGroupField)
		        
		      Else
		        sCurrentGroupName = jsFieldValues.Value(sGroupField)
		      End If
		      
		    End If
		    
		    // Add the current item to the current group array
		    oCurrentGroup.Append(oEvent)
		    
		  Next
		  
		  If oCurrentGroup.Ubound <> -1 Then
		    dim StupidDamnArrays() as DataFile.tbl_events
		    For Each oElement as DataFile.tbl_events In oCurrentGroup
		      StupidDamnArrays.Append(oElement)
		    Next
		    dictReturn.Value(sCurrentGroupName) = oCurrentGroup
		  End If
		  
		  Return dictReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(stmt as PreparedSQLStatement) As DataFile.tbl_events()
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  dim aro() as DataFile.tbl_events
		  
		  dim rs as recordset = stmt.SQLSelect
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  while rs.eof = false
		    dim oRecord as new DataFile.tbl_events
		    oRecord.ReadRecord(rs)
		    aro.Append oRecord
		    rs.MoveNext
		  wend
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function List(sCriteria as string = "", sOrder as string = "", iOffset as Integer = -1) As DataFile.tbl_events()
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim aro() as DataFile.tbl_events
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_events.BaseSQL
		  if sCriteria.Trim <> "" then
		    ars.append "WHERE " + sCriteria
		  end if
		  
		  if sOrder.trim <> "" then
		    ars.append " ORDER BY " + sOrder
		  else
		    'ars.append "<Your Field Here>"
		  end if
		  
		  if iOffset > -1 then
		    ars.append " LIMIT " + str(kMaxReturn) + " Offset " + str(iOffset)
		  end if
		  
		  dim s as string = ars.JoinSQL
		  dim rs as RecordSet = DB.SQLSelect(s)
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return aro
		  end
		  
		  do until rs.EOF
		    dim oRecord as new DataFile.tbl_events
		    oRecord.ReadRecord(rs)
		    
		    aro.Append(oRecord)
		    rs.MoveNext
		  loop
		  
		  
		  
		  return aro
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListCount(stmt as PreparedSQLStatement) As Integer
		  //Note: You should use this method if your query contains user entered data. Using this method will help prevent SQL injection attacks
		  
		  dim rs as Recordset = stmt.SQLSelect
		  
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return 0
		  end
		  return rs.Field("iCnt").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ListCount(sCriteria as string = "") As Integer
		  //Note: You should not use this method if your query contains user entered data.
		  //Using this method with user entered data could expose you to SQL injection attacks.
		  dim ars() as string
		  
		  
		  ars.append DataFile.tbl_events.BaseSQL(True)
		  if sCriteria<>"" then
		    ars.append "WHERE " + sCriteria
		  end if
		  dim s as string = ars.JoinSQL
		  dim rs as RecordSet = DB.SQLSelect(s)
		  
		  If DB.error then
		    break
		    System.debugLog DB.ErrorMessage
		    return 0
		  end
		  return rs.Field("iCnt").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function listGrouped(sCriteria as string = "", sOrder as string, sGroupBy as string = "", iOffset as integer = -1) As Dictionary
		  
		  dim dictReturn as New Dictionary
		  
		  // Load the entire Event List into a varialbe
		  dim oEvents() as DataFile.tbl_events
		  oEvents() = DataFile.tbl_events.List(sCriteria, sOrder, iOffset)
		  
		  
		  // Exract the fields we want to group by out of the sGroupBy string
		  dim sGroupFields() as string
		  sGroupFields = sGroupBy.Split(",")
		  
		  dim dictGrouped as New Dictionary
		  
		  If sGroupFields.Ubound >= 0 Then
		    
		    // Grab the current group fieldname
		    dim sGroup as String
		    sGroup = sGroupFields(0)
		    
		    dictGrouped = GroupRecords(oEvents,sGroup)
		    
		    If sGroupFields.Ubound >= 1 Then
		      For Each vKey as Variant In dictGrouped.Keys
		        
		        dim d1 as Dictionary
		        
		        // Grab the array of records out of the Dictionary
		        dim o2ndEvents() as DataFile.tbl_events
		        o2ndEvents() = dictGrouped.Value(vKey)
		        
		        // get it sorted and put into a dictionary
		        d1 = GroupRecords(o2ndEvents,sGroupFields(1))
		        
		        dictGrouped.Value(vKey) = d1
		        
		        If sGroupFields.Ubound >=2 Then
		          For Each v3rdKey as Variant In d1.Keys
		            
		            dim d3 as Dictionary
		            
		            // Grab the array of records out of the Dictionary
		            dim o3rdEvents() as DataFile.tbl_events
		            o3rdEvents() = d1.Value(v3rdKey)
		            
		            // Get it sorted and put into a dictionsar
		            d3 = GroupRecords(o3rdEvents,sGroupFields(2))
		            
		          Next
		          
		        End If
		        
		      Next
		      
		    End If
		    
		  End If
		  
		  if dictGrouped.Count = 0 Then
		    dictGrouped.Value("All") = oEvents
		  end if
		  Return dictGrouped
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		saccount_manager As String
	#tag EndProperty

	#tag Property, Flags = &h0
		send_date As String
	#tag EndProperty

	#tag Property, Flags = &h0
		send_time As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sevent_details As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sevent_name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sloadin_date As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sloadin_time As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sloadout_date As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sloadout_time As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sstart_date As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sstart_time As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ipkid"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastInsertID"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="saccount_manager"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="send_date"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="send_time"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sevent_details"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sevent_name"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sloadin_date"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sloadin_time"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sloadout_date"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sloadout_time"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srow_created"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srow_modified"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="srow_username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sstart_date"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sstart_time"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
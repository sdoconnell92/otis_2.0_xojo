#tag Class
Protected Class scripts_class
	#tag Method, Flags = &h0
		Sub EventName_ShowTextfield()
		  dim t as TextField
		  
		  t = window_main.textfield_event_name
		  t.Visible = True
		  t.Enabled = True
		  t.Text = window_main.label_event_name.Text
		  t.SetFocus
		  t.SelectAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEvent_Index_ByPkid(pkid as string) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function load_event() As boolean
		  dim db as otis_database_manager = app.otis_db
		  dim lb as Listbox = window_main.listbox_events
		  dim rs as RecordSet
		  
		  
		  
		  Try 
		    rs = db.execute(_
		    "Select", _
		    "events_", _
		    Array("pkid","name_","start_date","start_time","end_date","end_time","loadin_date","loadin_time","loadout_date","loadout_time","account_manager","details"),_
		    Array(""),_
		    Array(""),_
		    "")
		  Catch err as RuntimeException
		    MsgBox("Could not load event")
		    Return False
		  End Try
		  
		  
		  If rs <> Nil Then
		    
		    window_main.pkid_events_ = rs.Field("pkid").StringValue
		    If rs.Field("name_").StringValue <> "" Then window_main.label_event_name.Text = rs.Field("name_").StringValue Else window_main.label_event_name.Text = "Click Here To Name"
		    
		    
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub load_event_listbox()
		  dim rs as RecordSet
		  dim db as otis_database_manager = app.otis_db
		  dim lb as Listbox = window_main.listbox_events
		  
		  
		  
		  // Clear the listbox
		  lb.DeleteAllRows
		  
		  // Put the listbox together
		  lb.ColumnCount = 3
		  lb.ColumnWidths = "100%,0%,0%"
		  
		  
		  // Grab the event records
		  Try
		    rs = db.execute("Select","events_",Array("pkid","name_","start_date","start_time"),Array(""),Array(""),"")
		  Catch err as RuntimeException
		    MsgBox("Could not load event listbox")
		    Return
		  End Try
		  
		  If rs <> Nil Then
		    
		    //loop through all the records
		    For i1 as integer = 0 To rs.RecordCount
		      
		      dim name as string = rs.Field("name_").StringValue
		      dim start_date_ as string = rs.Field("start_date").StringValue
		      dim start_time_ as string = rs.Field("start_time").StringValue
		      
		      
		      If i1 = 0 Then
		        lb.AddRow("Name","","")
		      Else
		        lb.AddRow(Array(name,start_date_,start_time_))
		        rs.MoveNext
		      End If
		      
		      
		    Next
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub new_event()
		  dim rs as RecordSet
		  dim db as otis_database_manager = app.otis_db
		  dim lb as listbox = window_main.listbox_events
		  
		  
		  
		  
		  Try
		    rs = db.execute("Insert","events_",Array(""),Array(""),Array(""),"")
		  Catch err as RuntimeException
		    MsgBox("Could not create an event")
		    Return
		  End Try
		  
		  dim thepkid as string = rs.Field("pkid").StringValue
		  window_main.pkid_events_ = thepkid
		  
		  load_event_listbox
		  EventName_ShowTextfield
		  
		  
		  
		  lb.ListIndex = GetEvent_Index_ByPkid("thepkid")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub start_script()
		  // In this script we will be handling launcing all the necesarry methods to
		  // Connect to the local database and create its structure 
		  // Connect to the remote databse
		  
		  
		  // Check for update
		  
		  dim f as new FolderItem 
		  f = resource_management.get_filepath("otis_db_file")
		  if f <> Nil Then
		    if f.Exists Then
		      f.Delete
		    end if
		  end if
		  
		  
		  
		  // Attempt connection to local database
		  app.otis_db = new otis_database_manager
		  Try 
		    app.otis_db.connect_to_local
		  Catch err as RuntimeException
		    err_manage
		    Return
		  End Try
		  
		  // Check if the local database is initialized
		  If Not app.otis_db.local_db.initialized Then
		    
		    'database not initialized we need to do so
		    app.otis_db.initialize_local
		  end if
		  
		  
		  // Attempt Connection to remote database
		  Try
		    app.otis_db.connect_to_remote
		  Catch err as RuntimeException
		    err_manage( "remote_db", err.ErrorNumber, err.Message )
		  End Try
		  
		  // Check the state of the data
		  Select Case app.otis_db.data_state
		  Case "full_sync"
		    If app.otis_db.full_sync = 0 Then
		      app.otis_db.work_offline = False
		    Else
		      MsgBox( "Errors occurred while doing a full sync from remote to local database" )
		      app.otis_db.work_offline = False
		    End If
		  Case "half_sync"
		    
		  Case "offline"
		    app.otis_db.work_offline = True
		  Case "no_luck"
		    
		  End Select
		  
		  
		  
		  
		  
		  MsgBox( "running" )
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
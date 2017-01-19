#tag Module
Protected Module OtisDBModule
	#tag Method, Flags = &h1
		Protected Function CheckDatabase() As Boolean
		  Dim rd1 as New Logic.ResourceDirectories
		  
		  Return CheckDatabase( rd1.db_file.FilePath, LocalDatabaseCheckScript )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CheckDatabase(DatabaseFile as FolderItem, CreationScript as string) As Boolean
		  // RuntimeException
		  
		  Dim RD1 as new Logic.ResourceDirectories
		  Dim db1 as New SQLiteDatabase 
		  Dim ErrorCount as integer
		  Dim ErrorList() as string
		  Dim ReturnValue as Integer  ' 0=unchanged , 1=check failed , 2=check passed
		  
		  
		  // Connect To database file
		  db1.DatabaseFile = DatabaseFile
		  If Not db1.Connect Then
		    // No database file
		    ReturnValue = 1
		    
		  Else
		    ' There is a database file
		    
		    // Create tables in database file
		    
		    ' Break sql into individual statements
		    Dim sql_statements() as string
		    sql_statements = Split( CreationScript, ";" )
		    
		    // Add ';' back to sql statements and execute
		    For i1 as integer = 0 To sql_statements.Ubound
		      
		      If InStr(sql_statements(i1),"Select") > 0 Then
		        ' Add ';' back in
		        sql_statements(i1) = sql_statements(i1) + " Where pkid = 0 ;"
		      Else
		        sql_statements.Remove(i1)
		        Continue
		      End If
		      
		      'extract just the fields
		      Dim s1,oFields() as string
		      s1 = Mid(sql_statements(i1),InStr(s1,"Select") + 7 )
		      s1 = Left(s1,s1.InStr("From") - 1)
		      oFields = Split(s1,",")
		      
		      'Execute sql
		      Dim rs1 as RecordSet
		      rs1 = db1.SQLSelect(sql_statements(i1))
		      If db1.Error Then
		        ErrorList.Append db1.ErrorMessage
		        ErrorCount = ErrorCount + 1
		      End If
		      
		      If rs1 <> Nil Then
		        // Check oFields total compared to rs1.FieldCount
		        If oFields.Ubound + 1 <> rs1.FieldCount Then
		          'Number of fields to not match 
		          ReturnValue = 1
		          Exit
		        Else
		          If ReturnValue <> 1 Then
		            ReturnValue = 2
		          End If
		        End If
		      Else
		        ReturnValue = 1
		      End If
		      
		      
		    Next
		    
		    // Check if there were any errors
		    If ErrorCount <> 0 Then
		      'errors occurred
		      break
		      ReturnValue = 1
		    Else
		      If ReturnValue <> 1 Then
		        ReturnValue = 2
		      End If
		      
		    End If
		    
		    Dim rs2 as RecordSet
		    // Now we check the count of tables
		    rs2 = db1.SQLSelect("Select count(*) From sqlite_master Where type = 'table';")
		    If db1.Error Then
		      break
		    End If
		    
		    dim n1 as integer
		    n1 = rs2.Field("count(*)").IntegerValue
		    If n1 <> sql_statements.Ubound + 1 Then
		      'table number mismatch
		      ReturnValue = 1
		    Else
		      
		    End If
		    
		    
		  End If
		  
		  db1.Close
		  
		  Select Case ReturnValue
		  Case 0 or 1 
		    Return False
		  Case 2
		    Return True
		  End Select
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateDatabase()
		  Dim rd1 as New Logic.ResourceDirectories
		  
		  CreateDatabase( rd1.db_file.FilePath, TableCreationScript )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateDatabase(DatabaseFile as FolderItem, CreationScript as String)
		  // RuntimeException
		  
		  Dim RD1 as new Logic.ResourceDirectories
		  Dim db1 as New SQLiteDatabase
		  Dim ErrorCount as integer
		  Dim ErrorList() as string
		  
		  
		  // Create the database file
		  db1.DatabaseFile = DatabaseFile
		  If Not db1.CreateDatabaseFile Then
		    db1.Close
		    Dim err as RuntimeException
		    err.Message = "Could not create database file"
		    Raise err
		  End If
		  
		  
		  // Create tables in database file
		  
		  ' Break sql into individual statements
		  Dim sql_statements() as string
		  sql_statements = Split( CreationScript, ";" )
		  
		  // Add ';' back to sql statements and execute
		  For i1 as integer = 0 To sql_statements.Ubound
		    
		    ' Add ';' back in
		    sql_statements(i1) = sql_statements(i1) + ";"
		    
		    'Execute sql
		    db1.SQLExecute(sql_statements(i1))
		    If db1.Error Then
		      ErrorCount = ErrorCount + 1
		      Redim ErrorList(ErrorCount - 1)
		      ErrorList( ErrorCount - 1 ) = db1.ErrorMessage
		      ErrManage( "dbCreation",db1.ErrorMessage )
		    End If
		    
		  Next
		  
		  db1.Close
		  
		  // Check if there were any errors
		  If ErrorCount <> 0 Then
		    Dim err as New RuntimeException
		    err.Message = "There were errors during database table creation"
		    Raise err
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateNewPKID() As Int64
		  Dim d1 as new date
		  Dim clientID as integer
		  Dim theTicks as integer
		  Dim rd1 as new Logic.ResourceDirectories
		  Dim NewPKID as Int64
		  
		  // Get the clientID
		  clientID = Logic.Loadcli
		  
		  If clientID = 0 Then
		    'something is wrong no client id
		    dim err as RuntimeException
		    err.Message = "ClientID Missing could not create new pkid"
		    ErrManage( "CreateNewPKID", err.Message + " | " + Join(err.Stack,","))
		    raise err
		  End If
		  
		  
		  'Get the nex auo incremeting
		  'Dim PKIDTHE as New DataFile.tbl_incrementing
		  Dim n1 as integer
		  'n1 = PKIDTHE.ID
		  
		  
		  Dim db1 as New SQLiteDatabase
		  db1.DatabaseFile = rd1.utility_db_file.FilePath
		  If db1.Connect Then
		    db1.SQLExecute("Insert Into tbl_incrementing Default Values;")
		    If db1.Error Then
		      dim err as new RuntimeException
		      err.Message = db1.ErrorMessage
		    End If
		    n1 = db1.LastRowID
		    db1 = Nil
		  End If
		  
		  NewPKID = val( clientID.ToText + n1.ToText )
		  
		  Return NewPKID
		End Function
	#tag EndMethod


	#tag Constant, Name = LocalDatabaseCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"--local_database_check\r\n\r\n\r\n-- User Tables\r\n    \r\n    -- events_\r\n    Select \r\n        pkid                \x2C\r\n        row_created         \x2C\r\n        row_modified        \x2C\r\n        row_username        \x2C\r\n        event_name          \x2C\r\n        start_time          \x2C\r\n        end_time            \x2C\r\n        loadin_time         \x2C\r\n        loadout_time        \x2C\r\n        start_date          \x2C\r\n        end_date            \x2C\r\n        loadin_date         \x2C\r\n        loadout_date        \x2C\r\n        event_details       \x2C\r\n        account_manager     \r\n        From tbl_events;\r\n\r\n    -- lineitems_\r\n    Select\r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkeipl                      \x2C\r\n        fkinventory                 \x2C\r\n        li_name                     \x2C\r\n        li_manufacturer             \x2C\r\n        li_model                    \x2C\r\n        li_department               \x2C\r\n        li_category                 \x2C\r\n        li_subcategory              \x2C\r\n        li_description              \x2C \r\n        li_type                     \x2C\r\n        li_price                    \x2C\r\n        li_note                     \x2C \r\n        li_rate                     \x2C\r\n        discount_percent            \x2C\r\n        discount_amount             \x2C\r\n        li_total                    \x2C\r\n        li_time                     \x2C\r\n        li_taxable                  \x2C\r\n        li_taxtotal                 \x2C\r\n        li_quantity                  \x2C\r\n        ignore_price_discrepency    \r\n        From tbl_lineitems\r\n        ;\r\n\r\n\r\n    -- inventory\r\n    Select \r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        item_name                   \x2C\r\n        item_manufacturer           \x2C\r\n        item_model                  \x2C\r\n        item_department             \x2C\r\n        item_category               \x2C\r\n        item_subcategory            \x2C\r\n        item_description            \x2C\r\n        item_type                   \x2C\r\n        item_quantity               \x2C\r\n        item_price                  \x2C\r\n        item_owner                  \x2C\r\n        item_taxable                \r\n        From tbl_inventory\r\n        ;\r\n\r\n\r\n    -- eipl_\r\n    Select \r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkevents                    \x2C\r\n        eipl_number                 \x2C\r\n        due_date                    \x2C\r\n        eipl_type                   \x2C\r\n        eipl_balance                \x2C\r\n        eipl_grand_total            \x2C\r\n        eipl_subtotal               \x2C\r\n        eipl_total_paid             \x2C\r\n        discount_amount             \x2C\r\n        discount_percent            \x2C\r\n        shipping_method             \x2C\r\n        tax_total                   \x2C\r\n        discount_total              \r\n        From tbl_eipl\r\n        ;\r\n\r\n\r\n    -- payments_\r\n    Select  \r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkeipl                      \x2C\r\n        payment_date                \x2C\r\n        payment_memo                \x2C\r\n        payment_amount              \x2C\r\n        payment_type                \r\n        From tbl_payments\r\n        ;\r\n\r\n\r\n    -- contact_venue_data\r\n    Select \r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkcontacts                  \x2C\r\n        fkvenues                    \x2C\r\n        fkevents                    \x2C\r\n        fkeipl                      \x2C\r\n        cvd_primary                 \r\n        From tbl_contact_venue_data\r\n        ;\r\n\r\n    -- contacts\r\n    Select\r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkconven                    \x2C\r\n        name_first                  \x2C\r\n        name_last                   \x2C\r\n        job_title                   \x2C\r\n        contact_company             \x2C\r\n        contact_email               \x2C\r\n        phone_number                \x2C\r\n        address_line1               \x2C\r\n        address_line2               \x2C\r\n        address_city                \x2C\r\n        address_state               \x2C\r\n        address_zip                 \x2C\r\n        address_country             \r\n        From tbl_contacts\r\n        ;\r\n\r\n\r\n    -- venues\r\n    Select\r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkconven                    \x2C\r\n        venue_name                  \x2C\r\n        venue_type                  \x2C\r\n        venue_company               \x2C\r\n        venue_email                 \x2C\r\n        phone_number                \x2C\r\n        address_line1               \x2C\r\n        address_line2               \x2C\r\n        address_city                \x2C\r\n        address_state               \x2C\r\n        address_zip                 \x2C\r\n        address_country             \r\n        From tbl_venues\r\n        ;\r\n\r\n\r\n    -- tbl_departments\r\n    Select\r\n        pkid                        \x2C\r\n        row_created                 \x2C\r\n        row_modified                \x2C\r\n        row_username                \x2C\r\n        fkeipl                      \x2C\r\n        department                  \x2C\r\n        grand_total                 \x2C\r\n        discount_subtotal           \x2C\r\n        discount_percent            \x2C\r\n        discount_amount             \r\n        From tbl_departments\r\n        ;\r\n"
	#tag EndConstant

	#tag Constant, Name = SyncDatabaseCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Select \r\n\tpkid\t\t\x2C\r\n\tjson_info\t\x2C\r\n\tpushed\t\t\r\nFrom\r\n\tchanges_raw\r\n\t;\r\n\r\nSelect \r\n\tpkid\t\t\x2C\r\n\tjson_info\t\x2C\r\n\tpushed \t\t\r\nFrom\r\n\tchanges_consolidated\r\n\t;"
	#tag EndConstant

	#tag Constant, Name = SyncDatabaseCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Create Table changes_raw\r\n\t(\r\n\tpkid\t\tText\tPrimary Key\x2C\r\n\tjson_info\tText\t\x2C\r\n\tpushed\t\tBoolean\t\r\n\t\t);\r\n\r\nCreate Table changes_consolidated\r\n\t(\r\n\tpkid\t\tText\tPrimary Key\x2C\r\n\tjson_info\tText\t\x2C\r\n\tpushed\t\tBoolean\t\r\n\t\t);"
	#tag EndConstant

	#tag Constant, Name = TableCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"-- ##################################\r\n-- ###### Create Otis Database ######\r\n-- ##################################\r\n\r\n\r\n\r\n-- User Tables\r\n    \r\n    -- events_\r\n    Create Table tbl_events\r\n        (\r\n        pkid                integer Primary Key\x2C\r\n        row_created         timestamp\x2C\r\n        row_modified        timestamp\x2C\r\n        row_username        text\x2C\r\n        event_name          text\x2C\r\n        start_time          text\x2C\r\n        end_time            text\x2C\r\n        loadin_time         text\x2C\r\n        loadout_time        text\x2C\r\n        start_date          text\x2C\r\n        end_date            text\x2C\r\n        loadin_date         text\x2C\r\n        loadout_date        text\x2C\r\n        event_details       text\x2C\r\n        account_manager     text\r\n        );\r\n\r\n    -- lineitems_\r\n    Create Table tbl_lineitems \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkeipl                      text\x2C\r\n        fkinventory                 text\x2C\r\n        li_name                     text\x2C\r\n        li_manufacturer             text\x2C\r\n        li_model                    text\x2C\r\n        li_department               text\x2C\r\n        li_category                 text\x2C\r\n        li_subcategory              text\x2C\r\n        li_description              text\x2C \r\n        li_type                     text\x2C\r\n        li_price                    integer\x2C\r\n        li_note                     text\x2C \r\n        li_rate                     text\x2C\r\n        discount_percent            integer\x2C\r\n        discount_amount             integer\x2C\r\n        li_total                    integer\x2C\r\n        li_time                     integer\x2C\r\n        li_taxable                  boolean\x2C\r\n        li_taxtotal                 integer\x2C\r\n        li_quantity                 double precision\x2C\r\n        ignore_price_discrepency    boolean\r\n        );\r\n\r\n\r\n    -- inventory\r\n    CREATE TABLE tbl_inventory \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        item_name                   text\x2C\r\n        item_manufacturer           text\x2C\r\n        item_model                  text\x2C\r\n        item_department             text\x2C\r\n        item_category               text\x2C\r\n        item_subcategory            text\x2C\r\n        item_description            text\x2C\r\n        item_type                   text\x2C\r\n        item_quantity               integer\x2C\r\n        item_price                  integer\x2C\r\n        item_owner                  text\x2C\r\n        item_taxable                text\r\n        );\r\n\r\n\r\n    -- eipl_\r\n    Create Table tbl_eipl \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkevents                    text\x2C\r\n        eipl_number                 integer\x2C\r\n        due_date                    text\x2C\r\n        eipl_type                   text\x2C\r\n        eipl_balance                integer\x2C\r\n        eipl_grand_total            integer\x2C\r\n        eipl_subtotal               integer\x2C\r\n        eipl_total_paid             integer\x2C\r\n        discount_amount             integer\x2C\r\n        discount_percent            integer\x2C\r\n        shipping_method             text\x2C\r\n        tax_total                   integer\x2C\r\n        discount_total              integer\r\n        );\r\n\r\n\r\n    -- payments_\r\n    Create Table tbl_payments \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkeipl                      text\x2C\r\n        payment_date                date\x2C\r\n        payment_memo                text\x2C\r\n        payment_amount              integer\x2C\r\n        payment_type                text\r\n        );\r\n\r\n\r\n    -- contact_venue_data\r\n    CREATE TABLE tbl_contact_venue_data \r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkcontacts                  text\x2C\r\n        fkvenues                    text\x2C\r\n        fkevents                    text\x2C\r\n        fkeipl                      text\x2C\r\n        cvd_primary                 boolean\r\n        );\r\n\r\n    -- contacts\r\n    CREATE TABLE tbl_contacts\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkconven                    text\x2C\r\n        name_first                  text\x2C\r\n        name_last                   text\x2C\r\n        job_title                   text\x2C\r\n        contact_company             text\x2C\r\n        contact_email               text\x2C\r\n        phone_number                text\x2C\r\n        address_line1               text\x2C\r\n        address_line2               text\x2C\r\n        address_city                text\x2C\r\n        address_state               text\x2C\r\n        address_zip                 text\x2C\r\n        address_country             text\r\n        );\r\n\r\n\r\n    -- venues\r\n    CREATE TABLE tbl_venues\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkconven                    text\x2C\r\n        venue_name                  text\x2C\r\n        venue_type                  text\x2C\r\n        venue_company               text\x2C\r\n        venue_email                 text\x2C\r\n        phone_number                text\x2C\r\n        address_line1               text\x2C\r\n        address_line2               text\x2C\r\n        address_city                text\x2C\r\n        address_state               text\x2C\r\n        address_zip                 text\x2C\r\n        address_country             text\r\n        );\r\n\r\n\r\n    -- tbl_departments\r\n    CREATE TABLE tbl_departments\r\n        (\r\n        pkid                        integer Primary Key\x2C\r\n        row_created                 timestamp\x2C\r\n        row_modified                timestamp\x2C\r\n        row_username                text\x2C\r\n        fkeipl                      text\x2C\r\n        department                  text\x2C\r\n        grand_total                 integer\x2C\r\n        discount_subtotal           integer\x2C\r\n        discount_percent            integer\x2C\r\n        discount_amount             integer\r\n        );"
	#tag EndConstant

	#tag Constant, Name = UtilityDatabaseCheckScript, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Select\r\n    \tpkid\r\n    \tFrom tbl_incrementing\r\n    \t;"
	#tag EndConstant

	#tag Constant, Name = UtilityDatabaseCreationScript, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"CREATE TABLE tbl_incrementing\r\n        (\r\n        pkid                        integer Primary Key\r\n        );"
	#tag EndConstant


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
End Module
#tag EndModule
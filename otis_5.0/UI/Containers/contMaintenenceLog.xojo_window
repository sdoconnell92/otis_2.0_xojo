#tag Window
Begin ContainerControl contMaintenenceLog
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   352
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   628
   Begin entListbox lbLogs
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      CellBackColor   =   &cFFFFFF00
      Enabled         =   True
      EraseBackground =   True
      GridLinesColor  =   &c00000000
      HasBackColor    =   False
      HasHeading      =   True
      Height          =   322
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   30
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   105
   End
   Begin TextField tfWorkSummary
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   204
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   49
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   136
   End
   Begin Label labWorkSummary
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Work Summary"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   50
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin PushButton pbAddLog
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "+"
      Default         =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin PushButton pbRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Ref"
      Default         =   False
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   37
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   34
   End
   Begin DateControl dcEntryDate
      AutoDeactivate  =   True
      Checked         =   False
      DateFormat      =   0
      Day             =   0
      DropDownIcon    =   0
      EmptyDates      =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   204
      LinuxDropDownMode=   True
      LinuxFontBold   =   False
      LinuxTextFont   =   "System"
      LinuxTextSize   =   0.0
      LinuxTextUnit   =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacFontBold     =   False
      MacTextFont     =   "System"
      MacTextSize     =   0.0
      Month           =   0
      OSXDropDownMode =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   101
      Visible         =   True
      Width           =   115
      WinFontBold     =   False
      WinTextFont     =   "System"
      WinTextSize     =   0.0
      WinTextUnit     =   0
      Year            =   0
   End
   Begin Label labEntryDate
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   114
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Entry Date"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   101
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin DateControl dcExitDate
      AutoDeactivate  =   True
      Checked         =   False
      DateFormat      =   0
      Day             =   0
      DropDownIcon    =   0
      EmptyDates      =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   204
      LinuxDropDownMode=   True
      LinuxFontBold   =   False
      LinuxTextFont   =   "System"
      LinuxTextSize   =   0.0
      LinuxTextUnit   =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacFontBold     =   False
      MacTextFont     =   "System"
      MacTextSize     =   0.0
      Month           =   0
      OSXDropDownMode =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   125
      Visible         =   True
      Width           =   115
      WinFontBold     =   False
      WinTextFont     =   "System"
      WinTextSize     =   0.0
      WinTextUnit     =   0
      Year            =   0
   End
   Begin Label labExitDate
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   114
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Exit Date"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   125
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin TextArea taWorkDescription
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   80
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   204
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   158
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   391
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   107
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Work Description"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   159
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
   Begin ComboBox pmWorkType
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   204
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   136
   End
   Begin Label labWorkType
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   117
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      Text            =   "Type"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   75
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddLog()
		  
		  // Create a new Log record
		  dim oNewLog as New DataFile.tbl_maintenance_Logs
		  oCurrentLog = oNewLog
		  tfWorkSummary.SetFocus
		  oCurrentLog.ifkinv_ex = fkInventoryExpanded
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(contParent as contInventory, ifkInventoryExpanded as Int64, ifkInventory as int64)
		  
		  // Set references to the parent container
		  ParentContainer = contParent
		  fkInventoryExpanded = ifkInventoryExpanded
		  fkInventory = ifkInventory
		  
		  // Load the expanded inventory for the requested Item
		  ParentContainer.oItems.LoadMaintenanceLogs(fkInventoryExpanded)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItem(oRowTag as lbrowtag, IdentifyingName as String)
		  break
		  
		  
		  If MsgBox("Are you sure you want to delete " + IdentifyingName, 4) = 6 Then
		    
		    dim otblObject as DataFile.tbl_maintenance_Logs = oRowTag.vtblRecord
		    
		    dim iPKID as integer = oRowTag.pkid
		    
		    otblObject.Delete
		    
		    dim n1 as integer = lbLogs.FindByPKID(iPKID)
		    If  n1 <> -1 Then
		      lbLogs.RemoveRow(n1)
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadItemsIntoListbox()
		  
		  // Delete all current rows in listbox
		  lbLogs.DeleteAllRows
		  
		  
		  // Grab the expanded inventory list From the Parent Container
		  dim oLogList() as DataFile.tbl_maintenance_Logs = ParentContainer.oItems.dictMaintenanceLogs.Value(fkInventoryExpanded)
		  
		  For i1 as integer = 0 To oLogList.Ubound
		    dim Log as DataFile.tbl_maintenance_Logs = oLogList(i1)
		    dim oRowTag as New lbRowTag
		    
		    // Add the pkid to the rowtag
		    oRowTag.pkid = Log.ipkid
		    oRowTag.vtblRecord = Log
		    
		    lbLogs.AddRow("")
		    
		    // Extract the field names and values as json item
		    dim jsFieldValues as JSONItem
		    jsFieldValues = Log.GetMyFieldValues(True)
		    
		    // Extract field names and values as json item from our parent
		    dim jsParentFieldValues as JSONItem
		    dim oParentRowTag as lbRowTag
		    dim oParentTableRecord as DataFile.tbl_inventory
		    oParentRowTag = ParentContainer.lbItems.RowTag(ParentContainer.lbItems.FindByPKID(fkInventory))
		    oParentTableRecord = oParentRowTag.vtblRecord
		    jsParentFieldValues = oParentTableRecord.GetMyFieldValues(True)
		    
		    For i2 as integer = 0 To sFieldNames.Ubound
		      
		      Try 
		        // Try to get the value for this field from our item variable
		        ReDim oRowTag.vColumnValues(i2)
		        oRowTag.vColumnValues(i2) = jsFieldValues.Value(sFieldNames(i2))
		      Catch e as KeyNotFoundException
		        
		        // Try to get the value for this field from our parent item 
		        ReDim oRowTag.vColumnValues(i2)
		        oRowTag.vColumnValues(i2) = jsParentFieldValues.Value(sFieldNames(i2))
		      End Try
		      
		    Next
		    
		    lbLogs.RowTag(lbLogs.LastIndex) = oRowTag
		    dim n2 as integer = lbLogs.LastIndex
		    LoadRow(n2,oRowTag)
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadLog(oLogRecord as DataFile.tbl_maintenance_Logs)
		  
		  oCurrentLog = oLogRecord
		  
		  tfWorkSummary.Text = oCurrentLog.swork_summary
		  
		  // Load Entry Date
		  If oCurrentLog.sentry_date = "" Then
		    dcEntryDate.DateValue = New Date
		    dcEntryDate.Checked = False
		  Else
		    dim dDate as New Date
		    dDate.SQLDate = oCurrentLog.sentry_date
		    dcEntryDate.DateValue = dDate
		    dcEntryDate.Checked = True
		  End If
		  
		  // Load Exit Date
		  If oCurrentLog.sexit_date = "" Then
		    dcExitDate.DateValue = New Date
		    dcExitDate.Checked = False
		  Else
		    dim dDate as New Date
		    dDate.SQLDate = oCurrentLog.sexit_date
		    dcExitDate.DateValue = dDate
		    dcExitDate.Checked = True
		  End If
		  
		  // Load Work Description
		  taWorkDescription.Text = oCurrentLog.swork_description
		  
		  // Load Work Type
		  pmWorkType.Text = oCurrentLog.swork_type
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRow(row as integer, oRowTag as lbRowTag)
		  
		  'dim oRowTag as New lbRowTag(oRecord,sFieldNames)
		  
		  'lbItems.RowTag(row) = oRowTag
		  
		  // Populate cells
		  For i1 as integer = 0 To sFieldNames.ubound
		    lbLogs.Cell(row,i1) = oRowTag.vColumnValues(i1)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshLogList()
		  
		  
		  ParentContainer.oItems.LoadMaintenanceLogs(fkInventoryExpanded)
		  LoadItemsIntoListbox
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveLog()
		  
		  oCurrentLog.Save
		  RefreshLogList
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		fkInventory As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		fkInventoryExpanded As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		iColumnTypes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		oCurrentLog As DataFile.tbl_maintenance_Logs
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentContainer As contInventory
	#tag EndProperty

	#tag Property, Flags = &h0
		sFieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeaders() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events lbLogs
	#tag Event
		Sub Open()
		  dim s1, s2() as string
		  
		  me.ColumnCount = 1
		  
		  For i1 as integer = 0 To me.ColumnCount - 1
		    me.ColumnType(i1) = 0
		  Next
		  
		  // Set header names
		  s1 = "Logs"
		  s2 = Split(s1,",")
		  sHeaders = s2
		  me.Heading = s2
		  
		  // Set Field Names 
		  s1 = "work_summary"
		  s2 = Split(s1,",")
		  sFieldNames = s2
		  
		  dim n1,n2() as integer
		  n2 = Array(0)
		  iColumnTypes = n2
		  me.ColumnType = n2
		  
		  
		  LoadItemsIntoListbox
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  If lbLogs.ListIndex <> -1 Then
		    
		    dim oRowTag as lbRowTag
		    oRowTag = lbLogs.RowTag(lbLogs.ListIndex)
		    
		    dim oRecord as DataFile.tbl_maintenance_Logs = oRowTag.vtblRecord
		    
		    LoadLog(oRecord)
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfWorkSummary
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.swork_summary = me.Text
		  SaveLog
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAddLog
	#tag Event
		Sub Action()
		  AddLog
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events dcEntryDate
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.sentry_date = me.DateValue.SQLDate
		  SaveLog
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events dcExitDate
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.sexit_date = me.DateValue.SQLDate
		  SaveLog
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events taWorkDescription
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.swork_description = me.Text
		  SaveLog
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmWorkType
	#tag Event
		Sub Open()
		  
		  dim s1 as string
		  s1 = "Check-Up,Repair,Retire"
		  
		  dim s2() as string
		  s2 = Split(s1,",")
		  
		  For i1 as integer = 0 To s2.Ubound
		    
		    me.AddRow(s2(i1))
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  oCurrentLog.swork_type = me.Text
		  SaveLog
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="fkInventory"
		Group="Behavior"
		Type="Int64"
	#tag EndViewProperty
	#tag ViewProperty
		Name="fkInventoryExpanded"
		Group="Behavior"
		Type="Int64"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

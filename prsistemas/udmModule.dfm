object dmModule: TdmModule
  Height = 480
  Width = 640
  object conexaoBanco: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=prsistemas;Data Source=FERNA' +
      'NDO-SILVA;Use Procedure for Prepare=1;Auto Translate=True;Packet' +
      ' Size=4096;Workstation ID=FERNANDO-SILVA;Use Encryption for Data' +
      '=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 408
    Top = 272
  end
end

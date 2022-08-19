unit udmModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  Data.DBXFirebird, Data.SqlExpr, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  IBX.IBUpdateSQL, FireDAC.Phys.IBBase, Data.Win.ADODB;

type
  TdmModule = class(TDataModule)
    conexaoBanco: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmModule: TdmModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
